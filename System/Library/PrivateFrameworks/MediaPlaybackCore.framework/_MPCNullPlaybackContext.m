@interface _MPCNullPlaybackContext
+ (BOOL)supportsSecureCoding;
- (Class)queueFeederClass;
- (NSString)label;
- (_MPCNullPlaybackContext)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)descriptionComponents;
- (void)encodeWithCoder:(id)a3;
- (void)setLabel:(id)a3;
@end

@implementation _MPCNullPlaybackContext

- (void).cxx_destruct
{
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v7.receiver = self;
  v7.super_class = (Class)_MPCNullPlaybackContext;
  id v4 = [(_MPCNullPlaybackContext *)&v7 copyWithZone:a3];
  v5 = [(_MPCNullPlaybackContext *)self label];
  [v4 setLabel:v5];

  return v4;
}

- (id)descriptionComponents
{
  v6.receiver = self;
  v6.super_class = (Class)_MPCNullPlaybackContext;
  v3 = [(_MPCNullPlaybackContext *)&v6 descriptionComponents];
  id v4 = (void *)[v3 mutableCopy];

  [v4 setObject:0 forKeyedSubscript:@"actionAfterQueueLoad"];
  [v4 setObject:0 forKeyedSubscript:@"queueEndAction"];
  [v4 setObject:0 forKeyedSubscript:@"repeat/shuffle"];
  [v4 setObject:self->_label forKeyedSubscript:@"label"];
  [v4 setObject:0 forKeyedSubscript:@"featureName"];

  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_MPCNullPlaybackContext;
  id v4 = a3;
  [(_MPCNullPlaybackContext *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_label, @"MPCNullPlaybackContextCodingKeyLabel", v5.receiver, v5.super_class);
}

- (_MPCNullPlaybackContext)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_MPCNullPlaybackContext;
  objc_super v5 = [(_MPCNullPlaybackContext *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"MPCNullPlaybackContextCodingKeyLabel"];
    label = v5->_label;
    v5->_label = (NSString *)v6;
  }
  return v5;
}

- (Class)queueFeederClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end