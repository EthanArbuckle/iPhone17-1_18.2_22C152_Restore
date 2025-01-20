@interface CNUIExternalComponentsFactory
- (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5;
@end

@implementation CNUIExternalComponentsFactory

- (id)alertActionWithTitle:(id)a3 style:(int64_t)a4 handler:(id)a5
{
  return (id)[MEMORY[0x1E4FB1410] actionWithTitle:a3 style:a4 handler:a5];
}

@end