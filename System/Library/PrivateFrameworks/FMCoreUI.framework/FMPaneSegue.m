@interface FMPaneSegue
- (BOOL)disableAnimation;
- (void)perform;
- (void)performFromEdge:(unint64_t)a3;
- (void)setDisableAnimation:(BOOL)a3;
@end

@implementation FMPaneSegue

- (void)perform
{
}

- (void)performFromEdge:(unint64_t)a3
{
  id v5 = [(UIStoryboardSegue *)self sourceViewController];
  v6 = [(UIStoryboardSegue *)self destinationViewController];
  if (v5)
  {
    v7 = v5;
    while (1)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      uint64_t v8 = [v7 parentViewController];

      v7 = (void *)v8;
      if (!v8) {
        goto LABEL_5;
      }
    }
    id v9 = v7;
  }
  else
  {
LABEL_5:
    id v9 = 0;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    [MEMORY[0x263EFF940] raise:*MEMORY[0x263EFF498], @"No instance of FMSlidingPaneViewController in controller hierarchy of %@", v5 format];
  }
  objc_msgSend(v9, "presentPaneViewController:fromEdge:animated:completion:", v6, a3, -[FMPaneSegue disableAnimation](self, "disableAnimation") ^ 1, 0);
}

- (BOOL)disableAnimation
{
  return self->_disableAnimation;
}

- (void)setDisableAnimation:(BOOL)a3
{
  self->_disableAnimation = a3;
}

@end