@interface CSListItem
- (CSListItem)initWithIdentifier:(id)a3 groupingIdentifier:(id)a4 sectionIdentifier:(id)a5;
- (CSListItemHosting)contentHost;
- (NCNotificationListSupplementaryViewConfiguration)configuration;
- (NSArray)swipeActions;
- (NSDate)contentCreatedDate;
- (NSString)description;
- (NSString)groupingIdentifier;
- (NSString)identifier;
- (NSString)sectionIdentifier;
- (UIAction)onTapAction;
- (double)relevanceScore;
- (id)descriptionBuilderWithMultilinePrefix:(id)a3;
- (id)descriptionWithMultilinePrefix:(id)a3;
- (id)succinctDescription;
- (id)succinctDescriptionBuilder;
- (void)setConfiguration:(id)a3;
- (void)setContentCreatedDate:(id)a3;
- (void)setContentHost:(id)a3;
- (void)setOnTapAction:(id)a3;
- (void)setRelevanceScore:(double)a3;
- (void)setSwipeActions:(id)a3;
@end

@implementation CSListItem

- (CSListItem)initWithIdentifier:(id)a3 groupingIdentifier:(id)a4 sectionIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)CSListItem;
  v12 = [(CSListItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_identifier, a3);
    objc_storeStrong((id *)&v13->_groupingIdentifier, a4);
    objc_storeStrong((id *)&v13->_sectionIdentifier, a5);
  }

  return v13;
}

- (NSString)description
{
  v6.receiver = self;
  v6.super_class = (Class)CSListItem;
  v3 = [(CSListItem *)&v6 description];
  v4 = [(CSListItem *)self descriptionWithMultilinePrefix:v3];

  return (NSString *)v4;
}

- (id)succinctDescription
{
  v2 = [(CSListItem *)self succinctDescriptionBuilder];
  v3 = [v2 build];

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)[MEMORY[0x1E4F4F718] builderWithObject:self];
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  v3 = [(CSListItem *)self descriptionBuilderWithMultilinePrefix:a3];
  v4 = [v3 build];

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  v4 = [(CSListItem *)self succinctDescriptionBuilder];
  id v5 = (id)[v4 appendObject:self->_identifier withName:@"identifier"];
  id v6 = (id)[v4 appendObject:self->_groupingIdentifier withName:@"groupingIdentifier"];
  id v7 = (id)[v4 appendObject:self->_sectionIdentifier withName:@"sectionIdentifier"];
  id v8 = (id)[v4 appendObject:self->_contentHost withName:@"contentHost"];
  id v9 = (id)[v4 appendObject:self->_onTapAction withName:@"onTapAction"];
  id v10 = (id)[v4 appendObject:self->_swipeActions withName:@"swipeActions"];

  return v4;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NCNotificationListSupplementaryViewConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (NSString)groupingIdentifier
{
  return self->_groupingIdentifier;
}

- (NSString)sectionIdentifier
{
  return self->_sectionIdentifier;
}

- (UIAction)onTapAction
{
  return self->_onTapAction;
}

- (void)setOnTapAction:(id)a3
{
}

- (NSArray)swipeActions
{
  return self->_swipeActions;
}

- (void)setSwipeActions:(id)a3
{
}

- (CSListItemHosting)contentHost
{
  return self->_contentHost;
}

- (void)setContentHost:(id)a3
{
}

- (NSDate)contentCreatedDate
{
  return self->_contentCreatedDate;
}

- (void)setContentCreatedDate:(id)a3
{
}

- (double)relevanceScore
{
  return self->_relevanceScore;
}

- (void)setRelevanceScore:(double)a3
{
  self->_relevanceScore = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentCreatedDate, 0);
  objc_storeStrong((id *)&self->_contentHost, 0);
  objc_storeStrong((id *)&self->_swipeActions, 0);
  objc_storeStrong((id *)&self->_onTapAction, 0);
  objc_storeStrong((id *)&self->_sectionIdentifier, 0);
  objc_storeStrong((id *)&self->_groupingIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end