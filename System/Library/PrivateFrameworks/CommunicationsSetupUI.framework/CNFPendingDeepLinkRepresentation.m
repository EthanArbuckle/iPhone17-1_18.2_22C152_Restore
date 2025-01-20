@interface CNFPendingDeepLinkRepresentation
- (NSDictionary)resourceDictionary;
- (id)completion;
- (void)setCompletion:(id)a3;
- (void)setResourceDictionary:(id)a3;
@end

@implementation CNFPendingDeepLinkRepresentation

- (NSDictionary)resourceDictionary
{
  return self->_resourceDictionary;
}

- (void)setResourceDictionary:(id)a3
{
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_resourceDictionary, 0);
}

@end