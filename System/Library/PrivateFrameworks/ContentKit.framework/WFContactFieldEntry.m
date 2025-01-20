@interface WFContactFieldEntry
+ (BOOL)supportsSecureCoding;
+ (id)processingValueClasses;
- (BOOL)isEqual:(id)a3;
- (NSString)customHandle;
- (NSString)wfName;
- (WFContact)contact;
- (WFContactFieldEntry)initWithCoder:(id)a3;
- (WFContactFieldEntry)initWithContact:(id)a3;
- (WFContactFieldEntry)initWithCustomHandle:(id)a3;
- (WFContactFieldEntry)initWithEmailAddress:(id)a3;
- (WFContactFieldEntry)initWithHandleString:(id)a3;
- (WFContactFieldEntry)initWithHandleString:(id)a3 allowsCustomHandles:(BOOL)a4;
- (WFContactFieldEntry)initWithMessageGroup:(id)a3;
- (WFContactFieldEntry)initWithPhoneNumber:(id)a3;
- (WFEmailAddress)emailAddress;
- (WFMessageGroup)messageGroup;
- (WFPhoneNumber)phoneNumber;
- (id)contentItem;
- (id)description;
- (id)underlyingObject;
- (int64_t)type;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WFContactFieldEntry

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageGroup, 0);
  objc_storeStrong((id *)&self->_customHandle, 0);
  objc_storeStrong((id *)&self->_emailAddress, 0);
  objc_storeStrong((id *)&self->_phoneNumber, 0);
  objc_storeStrong((id *)&self->_contact, 0);
}

- (WFMessageGroup)messageGroup
{
  return self->_messageGroup;
}

- (NSString)customHandle
{
  return self->_customHandle;
}

- (WFEmailAddress)emailAddress
{
  return self->_emailAddress;
}

- (WFPhoneNumber)phoneNumber
{
  return self->_phoneNumber;
}

- (WFContact)contact
{
  return self->_contact;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v6 = a3;
  objc_msgSend(v6, "encodeInteger:forKey:", -[WFContactFieldEntry type](self, "type"), @"type");
  switch([(WFContactFieldEntry *)self type])
  {
    case 0:
      v4 = [(WFContactFieldEntry *)self contact];
      v5 = @"contact";
      goto LABEL_7;
    case 1:
      v4 = [(WFContactFieldEntry *)self phoneNumber];
      v5 = @"phoneNumber";
      goto LABEL_7;
    case 2:
      v4 = [(WFContactFieldEntry *)self emailAddress];
      v5 = @"emailAddress";
      goto LABEL_7;
    case 3:
      v4 = [(WFContactFieldEntry *)self customHandle];
      v5 = @"customHandle";
      goto LABEL_7;
    case 4:
      v4 = [(WFContactFieldEntry *)self messageGroup];
      v5 = @"messageGroup";
LABEL_7:
      [v6 encodeObject:v4 forKey:v5];

      break;
    default:
      break;
  }
}

- (WFContactFieldEntry)initWithCoder:(id)a3
{
  id v4 = a3;
  switch([v4 decodeIntegerForKey:@"type"])
  {
    case 0:
      v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"contact"];
      id v6 = [(WFContactFieldEntry *)self initWithContact:v5];
      goto LABEL_8;
    case 1:
      v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"phoneNumber"];
      id v6 = [(WFContactFieldEntry *)self initWithPhoneNumber:v5];
      goto LABEL_8;
    case 2:
      v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"emailAddress"];
      id v6 = [(WFContactFieldEntry *)self initWithEmailAddress:v5];
      goto LABEL_8;
    case 3:
      v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"customHandle"];
      id v6 = [(WFContactFieldEntry *)self initWithCustomHandle:v5];
      goto LABEL_8;
    case 4:
      v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"messageGroup"];
      id v6 = [(WFContactFieldEntry *)self initWithMessageGroup:v5];
LABEL_8:
      self = v6;

      v7 = self;
      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (NSString)wfName
{
  switch(self->_type)
  {
    case 0:
      v2 = [(WFContactFieldEntry *)self contact];
      uint64_t v3 = [v2 wfName];
      goto LABEL_8;
    case 1:
      v2 = [(WFContactFieldEntry *)self phoneNumber];
      uint64_t v3 = [v2 formattedPhoneNumber];
      goto LABEL_8;
    case 2:
      v2 = [(WFContactFieldEntry *)self emailAddress];
      uint64_t v3 = [v2 address];
      goto LABEL_8;
    case 3:
      id v4 = [(WFContactFieldEntry *)self customHandle];
      break;
    case 4:
      v2 = [(WFContactFieldEntry *)self messageGroup];
      uint64_t v3 = [v2 name];
LABEL_8:
      id v4 = (void *)v3;

      break;
    default:
      id v4 = 0;
      break;
  }
  return (NSString *)v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WFContactFieldEntry *)a3;
  if (v4 == self)
  {
    char v8 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && (uint64_t v5 = [(WFContactFieldEntry *)v4 type], v5 == [(WFContactFieldEntry *)self type]))
    {
      id v6 = [(WFContactFieldEntry *)v4 underlyingObject];
      v7 = [(WFContactFieldEntry *)self underlyingObject];
      char v8 = [v6 isEqual:v7];
    }
    else
    {
      char v8 = 0;
    }
  }

  return v8;
}

- (unint64_t)hash
{
  int64_t v3 = [(WFContactFieldEntry *)self type];
  id v4 = [(WFContactFieldEntry *)self underlyingObject];
  unint64_t v5 = v3 ^ 0xA700 ^ [v4 hash];

  return v5;
}

- (id)underlyingObject
{
  switch(self->_type)
  {
    case 0:
      self = [(WFContactFieldEntry *)self contact];
      break;
    case 1:
      self = [(WFContactFieldEntry *)self phoneNumber];
      break;
    case 2:
      self = [(WFContactFieldEntry *)self emailAddress];
      break;
    case 3:
      self = [(WFContactFieldEntry *)self customHandle];
      break;
    case 4:
      self = [(WFContactFieldEntry *)self messageGroup];
      break;
    default:
      break;
  }
  return self;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)WFContactFieldEntry;
  int64_t v3 = [(WFContactFieldEntry *)&v7 description];
  id v4 = [(WFContactFieldEntry *)self underlyingObject];
  unint64_t v5 = [v3 stringByAppendingFormat:@": %@", v4];

  return v5;
}

- (WFContactFieldEntry)initWithMessageGroup:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContactFieldEntry.m", 68, @"Invalid parameter not satisfying: %@", @"messageGroup" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  objc_super v7 = [(WFContactFieldEntry *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_messageGroup, a3);
    v8->_type = 4;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithCustomHandle:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContactFieldEntry.m", 56, @"Invalid parameter not satisfying: %@", @"customHandle" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  id v6 = [(WFContactFieldEntry *)&v12 init];
  if (v6)
  {
    uint64_t v7 = [v5 copy];
    customHandle = v6->_customHandle;
    v6->_customHandle = (NSString *)v7;

    v6->_type = 3;
    v9 = v6;
  }

  return v6;
}

- (WFContactFieldEntry)initWithEmailAddress:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContactFieldEntry.m", 44, @"Invalid parameter not satisfying: %@", @"emailAddress" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  uint64_t v7 = [(WFContactFieldEntry *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_emailAddress, a3);
    v8->_type = 2;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithPhoneNumber:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContactFieldEntry.m", 32, @"Invalid parameter not satisfying: %@", @"phoneNumber" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  uint64_t v7 = [(WFContactFieldEntry *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_phoneNumber, a3);
    v8->_type = 1;
    v9 = v8;
  }

  return v8;
}

- (WFContactFieldEntry)initWithContact:(id)a3
{
  id v6 = a3;
  if (!v6)
  {
    v11 = [MEMORY[0x263F08690] currentHandler];
    [v11 handleFailureInMethod:a2, self, @"WFContactFieldEntry.m", 20, @"Invalid parameter not satisfying: %@", @"contact" object file lineNumber description];
  }
  v12.receiver = self;
  v12.super_class = (Class)WFContactFieldEntry;
  uint64_t v7 = [(WFContactFieldEntry *)&v12 init];
  char v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_contact, a3);
    v8->_type = 0;
    v9 = v8;
  }

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)processingValueClasses
{
  v4[3] = *MEMORY[0x263EF8340];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v2 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
  return v2;
}

- (WFContactFieldEntry)initWithHandleString:(id)a3 allowsCustomHandles:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int64_t v7 = +[WFContact predictedTypeForHandleValue:v6 allowsCustomHandles:v4];
  switch(v7)
  {
    case 2:
      self = [(WFContactFieldEntry *)self initWithCustomHandle:v6];
      break;
    case 1:
      char v8 = +[WFEmailAddress addressWithEmailAddress:v6];
      v9 = [(WFContactFieldEntry *)self initWithEmailAddress:v8];
      goto LABEL_7;
    case 0:
      char v8 = +[WFPhoneNumber phoneNumberWithPhoneNumberString:v6];
      v9 = [(WFContactFieldEntry *)self initWithPhoneNumber:v8];
LABEL_7:
      self = v9;

      break;
  }

  return self;
}

- (WFContactFieldEntry)initWithHandleString:(id)a3
{
  return [(WFContactFieldEntry *)self initWithHandleString:a3 allowsCustomHandles:0];
}

- (id)contentItem
{
  unint64_t v4 = [(WFContactFieldEntry *)self type];
  if (v4 >= 4)
  {
    if (v4 != 4) {
      goto LABEL_6;
    }
    id v5 = [(WFContactFieldEntry *)self messageGroup];
    id v6 = [v5 name];
    v2 = +[WFContentItem itemWithObject:v6];
  }
  else
  {
    id v5 = [(WFContactFieldEntry *)self underlyingObject];
    v2 = +[WFContentItem itemWithObject:v5];
  }

LABEL_6:
  return v2;
}

@end