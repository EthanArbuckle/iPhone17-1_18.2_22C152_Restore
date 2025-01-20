@interface MFComposeRecipientOriginContext
- (NSString)searchTerm;
- (unint64_t)resultType;
- (void)setResultType:(unint64_t)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation MFComposeRecipientOriginContext

- (void)setSearchTerm:(id)a3
{
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void).cxx_destruct
{
}

@end