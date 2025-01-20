@interface CKChatItemCachedSizeMetrics
+ (BOOL)supportsSecureCoding;
- (CGSize)size;
- (CKChatItemCachedSizeMetrics)initWithCoder:(id)a3;
- (IMDoubleLinkedListNode)node;
- (NSDate)lastAccess;
- (NSString)chatItemGUID;
- (NSString)key;
- (UIEdgeInsets)textAlignmentInsets;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setChatItemGUID:(id)a3;
- (void)setKey:(id)a3;
- (void)setLastAccess:(id)a3;
- (void)setNode:(id)a3;
- (void)setSize:(CGSize)a3;
- (void)setTextAlignmentInsets:(UIEdgeInsets)a3;
@end

@implementation CKChatItemCachedSizeMetrics

- (CKChatItemCachedSizeMetrics)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = objc_alloc_init(CKChatItemCachedSizeMetrics);
  v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CGUID"];
  [(CKChatItemCachedSizeMetrics *)v5 setChatItemGUID:v6];

  [v4 decodeCGSizeForKey:@"CAS"];
  -[CKChatItemCachedSizeMetrics setSize:](v5, "setSize:");
  [v4 decodeUIEdgeInsetsForKey:@"CITAI"];
  -[CKChatItemCachedSizeMetrics setTextAlignmentInsets:](v5, "setTextAlignmentInsets:");
  v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"CILA"];

  [(CKChatItemCachedSizeMetrics *)v5 setLastAccess:v7];
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(CKChatItemCachedSizeMetrics *)self chatItemGUID];
  [v4 encodeObject:v5 forKey:@"CGUID"];

  [(CKChatItemCachedSizeMetrics *)self size];
  objc_msgSend(v4, "encodeCGSize:forKey:", @"CAS");
  [(CKChatItemCachedSizeMetrics *)self textAlignmentInsets];
  objc_msgSend(v4, "encodeUIEdgeInsets:forKey:", @"CITAI");
  id v6 = [(CKChatItemCachedSizeMetrics *)self lastAccess];
  [v4 encodeObject:v6 forKey:@"CILA"];
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = objc_opt_class();
  [(CKChatItemCachedSizeMetrics *)self size];
  v5 = NSStringFromCGSize(v10);
  [(CKChatItemCachedSizeMetrics *)self textAlignmentInsets];
  id v6 = NSStringFromUIEdgeInsets(v11);
  v7 = [v3 stringWithFormat:@"<%@ - size %@ insets %@>", v4, v5, v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)chatItemGUID
{
  return self->_chatItemGUID;
}

- (void)setChatItemGUID:(id)a3
{
}

- (NSString)key
{
  return self->_key;
}

- (void)setKey:(id)a3
{
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setSize:(CGSize)a3
{
  self->_size = a3;
}

- (UIEdgeInsets)textAlignmentInsets
{
  double top = self->_textAlignmentInsets.top;
  double left = self->_textAlignmentInsets.left;
  double bottom = self->_textAlignmentInsets.bottom;
  double right = self->_textAlignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (void)setTextAlignmentInsets:(UIEdgeInsets)a3
{
  self->_textAlignmentInsets = a3;
}

- (NSDate)lastAccess
{
  return self->_lastAccess;
}

- (void)setLastAccess:(id)a3
{
}

- (IMDoubleLinkedListNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_node, 0);
  objc_storeStrong((id *)&self->_lastAccess, 0);
  objc_storeStrong((id *)&self->_key, 0);

  objc_storeStrong((id *)&self->_chatItemGUID, 0);
}

@end