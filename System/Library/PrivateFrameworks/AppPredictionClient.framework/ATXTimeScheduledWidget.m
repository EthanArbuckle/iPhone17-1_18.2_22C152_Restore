@interface ATXTimeScheduledWidget
+ (BOOL)supportsSecureCoding;
- (ATXCustomIntentDescription)intentDescription;
- (ATXTimeScheduledWidget)initWithCoder:(id)a3;
- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6;
- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6 intentDescription:(id)a7;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToATXTimeScheduledWidget:(id)a3;
- (NSString)container;
- (NSString)extensionId;
- (NSString)kind;
- (int64_t)family;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ATXTimeScheduledWidget

- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6
{
  return [(ATXTimeScheduledWidget *)self initWithContainer:a3 kind:a4 extensionId:a5 family:a6 intentDescription:0];
}

- (ATXTimeScheduledWidget)initWithContainer:(id)a3 kind:(id)a4 extensionId:(id)a5 family:(int64_t)a6 intentDescription:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  v24.receiver = self;
  v24.super_class = (Class)ATXTimeScheduledWidget;
  v16 = [(ATXTimeScheduledWidget *)&v24 init];
  if (v16)
  {
    uint64_t v17 = [v12 copy];
    container = v16->_container;
    v16->_container = (NSString *)v17;

    uint64_t v19 = [v13 copy];
    kind = v16->_kind;
    v16->_kind = (NSString *)v19;

    uint64_t v21 = [v14 copy];
    extensionId = v16->_extensionId;
    v16->_extensionId = (NSString *)v21;

    v16->_family = a6;
    objc_storeStrong((id *)&v16->_intentDescription, a7);
  }

  return v16;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  kind = self->_kind;
  id v5 = a3;
  [v5 encodeObject:kind forKey:@"kind"];
  [v5 encodeObject:self->_extensionId forKey:@"extension"];
  [v5 encodeObject:self->_container forKey:@"container"];
  [v5 encodeInteger:self->_family forKey:@"family"];
  [v5 encodeObject:self->_intentDescription forKey:@"intentDescription"];
}

- (ATXTimeScheduledWidget)initWithCoder:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)ATXTimeScheduledWidget;
  id v5 = [(ATXTimeScheduledWidget *)&v15 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kind"];
    kind = v5->_kind;
    v5->_kind = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"extension"];
    extensionId = v5->_extensionId;
    v5->_extensionId = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"container"];
    container = v5->_container;
    v5->_container = (NSString *)v10;

    v5->_family = [v4 decodeIntegerForKey:@"family"];
    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"intentDescription"];
    intentDescription = v5->_intentDescription;
    v5->_intentDescription = (ATXCustomIntentDescription *)v12;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_kind hash];
  NSUInteger v4 = [(NSString *)self->_extensionId hash] - v3 + 32 * v3;
  NSUInteger v5 = [(NSString *)self->_container hash];
  return self->_family - (v5 - v4 + 32 * v4) + 32 * (v5 - v4 + 32 * v4);
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (ATXTimeScheduledWidget *)a3;
  NSUInteger v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(ATXTimeScheduledWidget *)self isEqualToATXTimeScheduledWidget:v5];

  return v6;
}

- (BOOL)isEqualToATXTimeScheduledWidget:(id)a3
{
  NSUInteger v4 = (id *)a3;
  container = self->_container;
  BOOL v6 = (NSString *)v4[1];
  if (container == v6)
  {
  }
  else
  {
    v7 = v6;
    uint64_t v8 = container;
    char v9 = [(NSString *)v8 isEqual:v7];

    if ((v9 & 1) == 0) {
      goto LABEL_11;
    }
  }
  kind = self->_kind;
  v11 = (NSString *)v4[2];
  if (kind == v11)
  {
  }
  else
  {
    uint64_t v12 = v11;
    id v13 = kind;
    char v14 = [(NSString *)v13 isEqual:v12];

    if ((v14 & 1) == 0) {
      goto LABEL_11;
    }
  }
  extensionId = self->_extensionId;
  v16 = (NSString *)v4[3];
  if (extensionId == v16)
  {

    goto LABEL_13;
  }
  uint64_t v17 = v16;
  v18 = extensionId;
  char v19 = [(NSString *)v18 isEqual:v17];

  if (v19)
  {
LABEL_13:
    BOOL v20 = self->_family == (void)v4[4];
    goto LABEL_14;
  }
LABEL_11:
  BOOL v20 = 0;
LABEL_14:

  return v20;
}

- (NSString)container
{
  return self->_container;
}

- (NSString)kind
{
  return self->_kind;
}

- (NSString)extensionId
{
  return self->_extensionId;
}

- (int64_t)family
{
  return self->_family;
}

- (ATXCustomIntentDescription)intentDescription
{
  return self->_intentDescription;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentDescription, 0);
  objc_storeStrong((id *)&self->_extensionId, 0);
  objc_storeStrong((id *)&self->_kind, 0);

  objc_storeStrong((id *)&self->_container, 0);
}

@end