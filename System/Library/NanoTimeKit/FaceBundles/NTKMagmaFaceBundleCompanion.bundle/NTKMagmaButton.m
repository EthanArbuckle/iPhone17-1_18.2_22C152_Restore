@interface NTKMagmaButton
- (NTKMagmaButtonDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setHighlighted:(BOOL)a3;
@end

@implementation NTKMagmaButton

- (void)setHighlighted:(BOOL)a3
{
  BOOL v3 = a3;
  unsigned int v5 = [(NTKMagmaButton *)self isHighlighted];
  v7.receiver = self;
  v7.super_class = (Class)NTKMagmaButton;
  [(NTKMagmaButton *)&v7 setHighlighted:v3];
  if (v5 != v3)
  {
    v6 = [(NTKMagmaButton *)self delegate];
    [v6 buttonHighlightedChanged:v3];
  }
}

- (NTKMagmaButtonDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (NTKMagmaButtonDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end