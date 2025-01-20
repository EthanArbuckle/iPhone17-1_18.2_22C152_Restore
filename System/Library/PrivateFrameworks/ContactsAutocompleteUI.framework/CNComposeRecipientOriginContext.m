@interface CNComposeRecipientOriginContext
- (NSString)searchTerm;
- (unint64_t)resultType;
- (void)setResultType:(unint64_t)a3;
- (void)setSearchTerm:(id)a3;
@end

@implementation CNComposeRecipientOriginContext

- (NSString)searchTerm
{
  return self->_searchTerm;
}

- (void)setSearchTerm:(id)a3
{
}

- (unint64_t)resultType
{
  return self->_resultType;
}

- (void)setResultType:(unint64_t)a3
{
  self->_resultType = a3;
}

- (void).cxx_destruct
{
}

@end