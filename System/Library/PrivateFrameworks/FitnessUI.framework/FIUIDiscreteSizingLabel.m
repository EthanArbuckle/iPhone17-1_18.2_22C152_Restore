@interface FIUIDiscreteSizingLabel
- (FIUIDiscreteSizingLabelDelegate)delegate;
- (void)setDelegate:(id)a3;
- (void)setText:(id)a3;
@end

@implementation FIUIDiscreteSizingLabel

- (void)setText:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)FIUIDiscreteSizingLabel;
  [(FIUIDiscreteSizingLabel *)&v5 setText:a3];
  v4 = [(FIUIDiscreteSizingLabel *)self delegate];
  [v4 discreteSizingLabelDidChangeText:self];
}

- (FIUIDiscreteSizingLabelDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (FIUIDiscreteSizingLabelDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
}

@end