@interface LNConfirmationActionName
+ (BOOL)supportsSecureCoding;
- (BOOL)destructive;
- (LNConfirmationActionName)initWithCoder:(id)a3;
- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4;
- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8;
- (LNStaticDeferredLocalizedString)acceptLabel;
- (LNStaticDeferredLocalizedString)denyLabel;
- (NSArray)acceptAlternatives;
- (NSArray)denyAlternatives;
- (id)description;
- (int64_t)type;
- (void)encodeWithCoder:(id)a3;
@end

@implementation LNConfirmationActionName

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_denyAlternatives, 0);
  objc_storeStrong((id *)&self->_denyLabel, 0);
  objc_storeStrong((id *)&self->_acceptAlternatives, 0);
  objc_storeStrong((id *)&self->_acceptLabel, 0);
}

- (NSArray)denyAlternatives
{
  return self->_denyAlternatives;
}

- (LNStaticDeferredLocalizedString)denyLabel
{
  return self->_denyLabel;
}

- (NSArray)acceptAlternatives
{
  return self->_acceptAlternatives;
}

- (LNStaticDeferredLocalizedString)acceptLabel
{
  return self->_acceptLabel;
}

- (BOOL)destructive
{
  return self->_destructive;
}

- (int64_t)type
{
  return self->_type;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  objc_msgSend(v4, "encodeInteger:forKey:", -[LNConfirmationActionName type](self, "type"), @"type");
  objc_msgSend(v4, "encodeBool:forKey:", -[LNConfirmationActionName destructive](self, "destructive"), @"destructive");
  v5 = [(LNConfirmationActionName *)self acceptLabel];
  [v4 encodeObject:v5 forKey:@"acceptLabel"];

  v6 = [(LNConfirmationActionName *)self acceptAlternatives];
  [v4 encodeObject:v6 forKey:@"acceptAlternatives"];

  v7 = [(LNConfirmationActionName *)self denyLabel];
  [v4 encodeObject:v7 forKey:@"denyLabel"];

  id v8 = [(LNConfirmationActionName *)self denyAlternatives];
  [v4 encodeObject:v8 forKey:@"denyAlternatives"];
}

- (LNConfirmationActionName)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeIntegerForKey:@"type"];
  uint64_t v6 = [v4 decodeBoolForKey:@"destructive"];
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"acceptLabel"];
  id v8 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v9 = objc_opt_class();
  v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
  v11 = [v4 decodeObjectOfClasses:v10 forKey:@"acceptAlternatives"];

  v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"denyLabel"];
  v13 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v14 = objc_opt_class();
  v15 = objc_msgSend(v13, "setWithObjects:", v14, objc_opt_class(), 0);
  v16 = [v4 decodeObjectOfClasses:v15 forKey:@"denyAlternatives"];

  v17 = 0;
  if (v11 && v16)
  {
    self = [(LNConfirmationActionName *)self initWithType:v5 destructive:v6 acceptLabel:v7 acceptAlternatives:v11 denyLabel:v12 denyAlternatives:v16];
    v17 = self;
  }

  return v17;
}

- (id)description
{
  v3 = NSString;
  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  int64_t v6 = [(LNConfirmationActionName *)self type];
  if ([(LNConfirmationActionName *)self destructive]) {
    v7 = @"YES";
  }
  else {
    v7 = @"NO";
  }
  id v8 = [(LNConfirmationActionName *)self acceptLabel];
  uint64_t v9 = [(LNConfirmationActionName *)self acceptAlternatives];
  v10 = [(LNConfirmationActionName *)self denyLabel];
  v11 = [(LNConfirmationActionName *)self denyAlternatives];
  v12 = [v3 stringWithFormat:@"<%@: %p, type: %ld, destructive: %@, acceptLabel: %@, acceptAlternatives: %@, denyLabel: %@, denyAlternatives: %@>", v5, self, v6, v7, v8, v9, v10, v11];

  return v12;
}

- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4 acceptLabel:(id)a5 acceptAlternatives:(id)a6 denyLabel:(id)a7 denyAlternatives:(id)a8
{
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  v19 = v18;
  if (v16)
  {
    if (v18) {
      goto LABEL_3;
    }
  }
  else
  {
    v32 = [MEMORY[0x1E4F28B00] currentHandler];
    [v32 handleFailureInMethod:a2, self, @"LNConfirmationActionName.m", 33, @"Invalid parameter not satisfying: %@", @"acceptAlternatives" object file lineNumber description];

    if (v19) {
      goto LABEL_3;
    }
  }
  v33 = [MEMORY[0x1E4F28B00] currentHandler];
  [v33 handleFailureInMethod:a2, self, @"LNConfirmationActionName.m", 34, @"Invalid parameter not satisfying: %@", @"denyAlternatives" object file lineNumber description];

LABEL_3:
  v34.receiver = self;
  v34.super_class = (Class)LNConfirmationActionName;
  v20 = [(LNConfirmationActionName *)&v34 init];
  v21 = v20;
  if (v20)
  {
    v20->_type = a3;
    v20->_destructive = a4;
    uint64_t v22 = [v15 copy];
    acceptLabel = v21->_acceptLabel;
    v21->_acceptLabel = (LNStaticDeferredLocalizedString *)v22;

    uint64_t v24 = [v16 copy];
    acceptAlternatives = v21->_acceptAlternatives;
    v21->_acceptAlternatives = (NSArray *)v24;

    uint64_t v26 = [v17 copy];
    denyLabel = v21->_denyLabel;
    v21->_denyLabel = (LNStaticDeferredLocalizedString *)v26;

    uint64_t v28 = [v19 copy];
    denyAlternatives = v21->_denyAlternatives;
    v21->_denyAlternatives = (NSArray *)v28;

    v30 = v21;
  }

  return v21;
}

- (LNConfirmationActionName)initWithType:(int64_t)a3 destructive:(BOOL)a4
{
  return [(LNConfirmationActionName *)self initWithType:a3 destructive:a4 acceptLabel:0 acceptAlternatives:MEMORY[0x1E4F1CBF0] denyLabel:0 denyAlternatives:MEMORY[0x1E4F1CBF0]];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end