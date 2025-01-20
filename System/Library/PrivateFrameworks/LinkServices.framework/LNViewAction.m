@interface LNViewAction
+ (BOOL)supportsSecureCoding;
- (LNViewAction)initWithActionIdentifier:(id)a3 viewIdentifier:(int64_t)a4 location:(LNViewLocation *)a5;
- (LNViewAction)initWithCoder:(id)a3;
- (LNViewLocation)location;
- (NSString)actionIdentifier;
- (id)description;
- (int64_t)viewIdentifier;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNViewAction

- (void).cxx_destruct
{
}

- (LNViewLocation)location
{
  long long v3 = *(_OWORD *)&self->depth;
  *(_OWORD *)&retstr->x = *(_OWORD *)&self->width;
  *(_OWORD *)&retstr->z = v3;
  *(_OWORD *)&retstr->height = *(_OWORD *)&self[1].y;
  return self;
}

- (int64_t)viewIdentifier
{
  return self->_viewIdentifier;
}

- (NSString)actionIdentifier
{
  return self->_actionIdentifier;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  v4 = [(LNViewAction *)self actionIdentifier];
  [v5 encodeObject:v4 forKey:@"actionIdentifier"];

  objc_msgSend(v5, "encodeInteger:forKey:", -[LNViewAction viewIdentifier](self, "viewIdentifier"), @"viewIdentifier");
  [v5 encodeBytes:&self->_location length:48 forKey:@"location"];
}

- (LNViewAction)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"actionIdentifier"];
  uint64_t v6 = [v4 decodeIntegerForKey:@"viewIdentifier"];
  if (v5)
  {
    uint64_t v7 = v6;
    uint64_t v14 = 0;
    v8 = (long long *)[v4 decodeBytesForKey:@"location" returnedLength:&v14];
    v9 = 0;
    if (v8 && v14 == 48)
    {
      long long v10 = *v8;
      long long v11 = v8[2];
      v13[1] = v8[1];
      v13[2] = v11;
      v13[0] = v10;
      self = [(LNViewAction *)self initWithActionIdentifier:v5 viewIdentifier:v7 location:v13];
      v9 = self;
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)description
{
  long long v3 = NSString;
  id v4 = [(LNViewAction *)self actionIdentifier];
  int64_t v5 = [(LNViewAction *)self viewIdentifier];
  uint64_t v6 = LNViewLocationAsString((uint64_t *)&self->_location);
  uint64_t v7 = [v3 stringWithFormat:@"%@(%ld) @ %@", v4, v5, v6];

  return v7;
}

- (LNViewAction)initWithActionIdentifier:(id)a3 viewIdentifier:(int64_t)a4 location:(LNViewLocation *)a5
{
  id v10 = a3;
  if (v10)
  {
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    v17 = [MEMORY[0x1E4F28B00] currentHandler];
    [v17 handleFailureInMethod:a2, self, @"LNViewAction.m", 17, @"Invalid parameter not satisfying: %@", @"actionIdentifier" object file lineNumber description];

    if (a4) {
      goto LABEL_3;
    }
  }
  v18 = [MEMORY[0x1E4F28B00] currentHandler];
  [v18 handleFailureInMethod:a2, self, @"LNViewAction.m", 18, @"Invalid parameter not satisfying: %@", @"viewIdentifier" object file lineNumber description];

LABEL_3:
  v19.receiver = self;
  v19.super_class = (Class)LNViewAction;
  long long v11 = [(LNViewAction *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_actionIdentifier, a3);
    v12->_viewIdentifier = a4;
    long long v13 = *(_OWORD *)&a5->x;
    long long v14 = *(_OWORD *)&a5->z;
    *(_OWORD *)&v12->_location.height = *(_OWORD *)&a5->height;
    *(_OWORD *)&v12->_location.z = v14;
    *(_OWORD *)&v12->_location.x = v13;
    v15 = v12;
  }

  return v12;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end