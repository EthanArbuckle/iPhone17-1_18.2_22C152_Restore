@interface HTMLToSuper_A_Frame
- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7;
- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8;
@end

@implementation HTMLToSuper_A_Frame

- (void)parser:(id)a3 context:(id)a4 didStartElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7 attributes:(id)a8
{
  id v12 = (id)IMCopyNormalizedAttributes(a8, 1, 0);
  uint64_t v10 = [v12 objectForKey:@"href"];
  if (v10)
  {
    v11 = (void *)[objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:v10];
    if (v11)
    {
      [a4 pushLink:v11];
      self->_shouldPopLink = 1;
    }
  }
}

- (void)parser:(id)a3 context:(id)a4 didEndElement:(id)a5 namespaceURI:(id)a6 qualifiedName:(id)a7
{
  if (self->_shouldPopLink) {
    MEMORY[0x1F4181798](a4, sel_popLink);
  }
}

@end