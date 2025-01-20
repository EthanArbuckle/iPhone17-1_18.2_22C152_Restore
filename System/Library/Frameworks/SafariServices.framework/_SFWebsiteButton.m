@interface _SFWebsiteButton
- (_SFWebsiteButton)init;
- (id)activationHandler;
- (void)_activate:(id)a3;
- (void)setActivationHandler:(id)a3;
@end

@implementation _SFWebsiteButton

- (_SFWebsiteButton)init
{
  v7.receiver = self;
  v7.super_class = (Class)_SFWebsiteButton;
  v2 = [(_SFWebsiteButton *)&v7 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(_SFWebsiteButton *)v2 setTintColor:v3];

    v4 = [MEMORY[0x1E4FB1818] systemImageNamed:@"safari"];
    [(_SFWebsiteButton *)v2 setImage:v4 forState:0];

    [(_SFWebsiteButton *)v2 addTarget:v2 action:sel__activate_ forControlEvents:64];
    [(_SFWebsiteButton *)v2 sizeToFit];
    v5 = v2;
  }

  return v2;
}

- (void)_activate:(id)a3
{
  id v6 = a3;
  v4 = [(_SFWebsiteButton *)self activationHandler];

  if (v4)
  {
    v5 = [(_SFWebsiteButton *)self activationHandler];
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (id)activationHandler
{
  return self->_activationHandler;
}

- (void)setActivationHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end