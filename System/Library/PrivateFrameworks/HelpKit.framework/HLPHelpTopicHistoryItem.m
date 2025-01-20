@interface HLPHelpTopicHistoryItem
+ (BOOL)supportsSecureCoding;
- (CGPoint)contentOffset;
- (CGSize)contentSize;
- (HLPHelpTopicHistoryItem)initWithCoder:(id)a3;
- (NSString)anchor;
- (NSString)identifier;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setAnchor:(id)a3;
- (void)setContentOffset:(CGPoint)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setIdentifier:(id)a3;
- (void)setName:(id)a3;
@end

@implementation HLPHelpTopicHistoryItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = +[HLPHelpTopicHistoryItem allocWithZone:a3];
  [(HLPHelpTopicHistoryItem *)v4 setIdentifier:self->_identifier];
  [(HLPHelpTopicHistoryItem *)v4 setName:self->_name];
  -[HLPHelpTopicHistoryItem setContentSize:](v4, "setContentSize:", self->_contentSize.width, self->_contentSize.height);
  -[HLPHelpTopicHistoryItem setContentOffset:](v4, "setContentOffset:", self->_contentOffset.x, self->_contentOffset.y);
  [(HLPHelpTopicHistoryItem *)v4 setAnchor:self->_anchor];
  return v4;
}

- (HLPHelpTopicHistoryItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)HLPHelpTopicHistoryItem;
  v5 = [(HLPHelpTopicHistoryItem *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectForKey:@"HLPHelpHistoryIdentifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectForKey:@"HLPHelpHistoryName"];
    name = v5->_name;
    v5->_name = (NSString *)v8;

    [v4 decodeCGPointForKey:@"HLPHelpHistoryContentOffset"];
    v5->_contentOffset.x = v10;
    v5->_contentOffset.y = v11;
    [v4 decodeCGSizeForKey:@"HLPHelpHistoryContentSize"];
    v5->_contentSize.width = v12;
    v5->_contentSize.height = v13;
    uint64_t v14 = [v4 decodeObjectForKey:@"HLPHelpHistoryAnchor"];
    anchor = v5->_anchor;
    v5->_anchor = (NSString *)v14;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v5 = a3;
  [v5 encodeObject:identifier forKey:@"HLPHelpHistoryIdentifier"];
  [v5 encodeObject:self->_name forKey:@"HLPHelpHistoryName"];
  objc_msgSend(v5, "encodeCGPoint:forKey:", @"HLPHelpHistoryContentOffset", self->_contentOffset.x, self->_contentOffset.y);
  objc_msgSend(v5, "encodeCGSize:forKey:", @"HLPHelpHistoryContentSize", self->_contentSize.width, self->_contentSize.height);
  [v5 encodeObject:self->_anchor forKey:@"HLPHelpHistoryAnchor"];
}

- (CGPoint)contentOffset
{
  double x = self->_contentOffset.x;
  double y = self->_contentOffset.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setContentOffset:(CGPoint)a3
{
  self->_contentOffset = a3;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)anchor
{
  return self->_anchor;
}

- (void)setAnchor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_anchor, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end