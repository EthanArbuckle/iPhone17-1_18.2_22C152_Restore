@interface HLPHelpSectionItem
- (BOOL)isOpen;
- (NSArray)children;
- (id)debugDescription;
- (void)setChildren:(id)a3;
- (void)setOpen:(BOOL)a3;
@end

@implementation HLPHelpSectionItem

- (id)debugDescription
{
  v3 = (void *)MEMORY[0x263F089D8];
  v8.receiver = self;
  v8.super_class = (Class)HLPHelpSectionItem;
  v4 = [(HLPHelpItem *)&v8 debugDescription];
  v5 = [v3 stringWithString:v4];

  v6 = [(HLPHelpSectionItem *)self children];
  [v5 appendFormat:@"children: %@\n", v6];

  return v5;
}

- (BOOL)isOpen
{
  return self->_open;
}

- (void)setOpen:(BOOL)a3
{
  self->_open = a3;
}

- (NSArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
}

- (void).cxx_destruct
{
}

@end