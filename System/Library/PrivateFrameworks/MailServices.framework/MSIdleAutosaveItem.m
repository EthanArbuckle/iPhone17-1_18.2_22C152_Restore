@interface MSIdleAutosaveItem
+ (BOOL)supportsSecureCoding;
+ (id)withAutosaveIdentifier:(id)a3 subject:(id)a4;
- (MSIdleAutosaveItem)initWithAutosaveIdentifier:(id)a3 subject:(id)a4;
- (MSIdleAutosaveItem)initWithCoder:(id)a3;
- (NSString)autosaveIdentifier;
- (NSString)subject;
- (void)encodeWithCoder:(id)a3;
@end

@implementation MSIdleAutosaveItem

+ (id)withAutosaveIdentifier:(id)a3 subject:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = (void *)[objc_alloc((Class)a1) initWithAutosaveIdentifier:v6 subject:v7];

  return v8;
}

- (MSIdleAutosaveItem)initWithAutosaveIdentifier:(id)a3 subject:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MSIdleAutosaveItem;
  v9 = [(MSIdleAutosaveItem *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_autosaveIdentifier, a3);
    objc_storeStrong((id *)&v10->_subject, a4);
  }

  return v10;
}

- (MSIdleAutosaveItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"autosaveID"];
  id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"subject"];
  id v7 = [(MSIdleAutosaveItem *)self initWithAutosaveIdentifier:v5 subject:v6];

  return v7;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeObject:self->_autosaveIdentifier forKey:@"autosaveID"];
  [v4 encodeObject:self->_subject forKey:@"subject"];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)autosaveIdentifier
{
  return self->_autosaveIdentifier;
}

- (NSString)subject
{
  return self->_subject;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subject, 0);

  objc_storeStrong((id *)&self->_autosaveIdentifier, 0);
}

@end