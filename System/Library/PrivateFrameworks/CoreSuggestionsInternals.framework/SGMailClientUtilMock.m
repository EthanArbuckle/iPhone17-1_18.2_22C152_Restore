@interface SGMailClientUtilMock
- (EAEmailAddressSet)vips;
- (SGMailClientUtilMock)init;
- (id)allVIPEmailAddresses;
- (void)setVips:(id)a3;
@end

@implementation SGMailClientUtilMock

- (void).cxx_destruct
{
}

- (void)setVips:(id)a3
{
}

- (EAEmailAddressSet)vips
{
  return self->_vips;
}

- (id)allVIPEmailAddresses
{
  return self->_vips;
}

- (SGMailClientUtilMock)init
{
  v6.receiver = self;
  v6.super_class = (Class)SGMailClientUtilMock;
  v2 = [(SGMailClientUtilMock *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [MEMORY[0x1E4F1CAD0] set];
    vips = v2->_vips;
    v2->_vips = (EAEmailAddressSet *)v3;
  }
  return v2;
}

@end