@interface BLTSupplementaryActionInfo
- (NSString)identifier;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (void)setIdentifier:(id)a3;
@end

@implementation BLTSupplementaryActionInfo

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)BLTSupplementaryActionInfo;
  v4 = [(BLTActionInfo *)&v7 descriptionBuilderWithMultilinePrefix:a3];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end