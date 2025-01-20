@interface _VOTPreviousTableOrCellectionViewMetadata
- (NSString)label;
- (_NSRange)indexPath;
- (void)setIndexPath:(_NSRange)a3;
- (void)setLabel:(id)a3;
@end

@implementation _VOTPreviousTableOrCellectionViewMetadata

- (_NSRange)indexPath
{
  NSUInteger length = self->_indexPath.length;
  NSUInteger location = self->_indexPath.location;
  result.NSUInteger length = length;
  result.NSUInteger location = location;
  return result;
}

- (void)setIndexPath:(_NSRange)a3
{
  self->_indexPath = a3;
}

- (NSString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (void).cxx_destruct
{
}

@end