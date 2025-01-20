@interface CHSWidgetRelevanceGroupAttribute
+ (BOOL)supportsSecureCoding;
+ (CHSWidgetRelevanceGroupAttribute)ungrouped;
- (BOOL)isEqual:(id)a3;
- (CHSWidgetRelevanceGroupAttribute)initWithCoder:(id)a3;
- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3;
- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3 groupType:(unint64_t)a4;
- (NSString)groupIdentifier;
- (id)description;
- (unint64_t)groupType;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CHSWidgetRelevanceGroupAttribute

- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3 groupType:(unint64_t)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)CHSWidgetRelevanceGroupAttribute;
  v7 = [(CHSWidgetRelevanceAttribute *)&v12 _init];
  v8 = v7;
  if (v7)
  {
    v7->_groupType = a4;
    uint64_t v9 = [v6 copy];
    groupIdentifier = v8->_groupIdentifier;
    v8->_groupIdentifier = (NSString *)v9;
  }
  return v8;
}

- (CHSWidgetRelevanceGroupAttribute)initWithNamedGroupIdentifier:(id)a3
{
  return [(CHSWidgetRelevanceGroupAttribute *)self initWithNamedGroupIdentifier:a3 groupType:1];
}

+ (CHSWidgetRelevanceGroupAttribute)ungrouped
{
  v2 = (void *)[objc_alloc((Class)a1) initWithNamedGroupIdentifier:0 groupType:0];
  return (CHSWidgetRelevanceGroupAttribute *)v2;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  v4 = v3;
  if (self->_groupType) {
    v5 = @"named";
  }
  else {
    v5 = @"ungrouped";
  }
  [v3 appendString:v5 withName:@"groupType"];
  [v4 appendString:self->_groupIdentifier withName:@"groupIdentifier" skipIfEmpty:1];
  id v6 = [v4 build];

  return v6;
}

- (unint64_t)hash
{
  return self->_groupType ^ [(NSString *)self->_groupIdentifier hash];
}

- (BOOL)isEqual:(id)a3
{
  v4 = (CHSWidgetRelevanceGroupAttribute *)a3;
  if (v4 == self)
  {
    char v5 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v4->_groupType == self->_groupType) {
      char v5 = BSEqualObjects();
    }
    else {
      char v5 = 0;
    }
  }

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CHSWidgetRelevanceGroupAttribute)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CHSWidgetRelevanceGroupAttribute;
  char v5 = [(CHSWidgetRelevanceAttribute *)&v9 initWithCoder:v4];
  if (v5)
  {
    v5->_groupType = [v4 decodeIntegerForKey:@"type"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"groupIdentifier"];
    groupIdentifier = v5->_groupIdentifier;
    v5->_groupIdentifier = (NSString *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  [v4 encodeInteger:self->_groupType forKey:@"type"];
  [v4 encodeObject:self->_groupIdentifier forKey:@"groupIdentifier"];
}

- (NSString)groupIdentifier
{
  return self->_groupIdentifier;
}

- (unint64_t)groupType
{
  return self->_groupType;
}

- (void).cxx_destruct
{
}

@end