@interface _MKDirectionalArrowRecognizer
- (_MKDirectionalArrowRecognizer)initWithTarget:(id)a3 action:(SEL)a4;
- (int64_t)arrows;
- (int64_t)lastArrows;
- (int64_t)modifierFlags;
- (int64_t)state;
- (void)handleArrowMask:(int64_t)a3;
- (void)keyDown:(id)a3;
- (void)keyUp:(id)a3;
- (void)setModifierFlags:(int64_t)a3;
- (void)setState:(int64_t)a3;
@end

@implementation _MKDirectionalArrowRecognizer

- (_MKDirectionalArrowRecognizer)initWithTarget:(id)a3 action:(SEL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_MKDirectionalArrowRecognizer;
  v7 = [(_MKDirectionalArrowRecognizer *)&v12 init];
  v8 = v7;
  if (v7)
  {
    objc_storeWeak(&v7->_target, v6);
    if (a4) {
      SEL v9 = a4;
    }
    else {
      SEL v9 = 0;
    }
    v8->_action = v9;
    v10 = v8;
  }

  return v8;
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  if (self->_action) {
    SEL action = self->_action;
  }
  else {
    SEL action = 0;
  }
  id v6 = WeakRetained;
  [WeakRetained performSelector:action withObject:self];
}

- (void)handleArrowMask:(int64_t)a3
{
  int64_t arrows = self->_arrows;
  self->_int64_t arrows = a3;
  self->_lastArrows = arrows;
  int64_t v6 = [(_MKDirectionalArrowRecognizer *)self state];
  if (a3)
  {
    if (v6 != 1 && [(_MKDirectionalArrowRecognizer *)self state] != 2) {
      [(_MKDirectionalArrowRecognizer *)self setState:1];
    }
    [(_MKDirectionalArrowRecognizer *)self setState:2];
  }
  else if (v6 == 1 || [(_MKDirectionalArrowRecognizer *)self state] == 2)
  {
    [(_MKDirectionalArrowRecognizer *)self setState:3];
    self->_lastArrows = 0;
  }
}

- (void)keyDown:(id)a3
{
  id v6 = [a3 key];
  self->_modifierFlags = [v6 modifierFlags];
  int64_t arrows = self->_arrows;
  uint64_t v5 = [v6 keyCode];
  switch(v5)
  {
    case 'O':
      arrows |= 0x10uLL;
      goto LABEL_8;
    case 'P':
      arrows |= 8uLL;
      goto LABEL_8;
    case 'Q':
      goto LABEL_6;
    case 'R':
      goto LABEL_5;
    default:
      if (v5 == 45)
      {
LABEL_6:
        arrows |= 4uLL;
      }
      else if (v5 == 46)
      {
LABEL_5:
        arrows |= 2uLL;
      }
LABEL_8:
      [(_MKDirectionalArrowRecognizer *)self handleArrowMask:arrows];

      return;
  }
}

- (void)keyUp:(id)a3
{
  self->_modifierFlags = 0;
  v4 = [a3 key];
  int64_t arrows = self->_arrows;
  id v7 = v4;
  uint64_t v6 = [v4 keyCode];
  switch(v6)
  {
    case 'O':
      arrows &= ~0x10uLL;
      goto LABEL_8;
    case 'P':
      arrows &= ~8uLL;
      goto LABEL_8;
    case 'Q':
      goto LABEL_6;
    case 'R':
      goto LABEL_5;
    default:
      if (v6 == 45)
      {
LABEL_6:
        arrows &= ~4uLL;
      }
      else if (v6 == 46)
      {
LABEL_5:
        arrows &= ~2uLL;
      }
LABEL_8:
      [(_MKDirectionalArrowRecognizer *)self handleArrowMask:arrows];

      return;
  }
}

- (int64_t)state
{
  return self->_state;
}

- (int64_t)arrows
{
  return self->_arrows;
}

- (int64_t)lastArrows
{
  return self->_lastArrows;
}

- (int64_t)modifierFlags
{
  return self->_modifierFlags;
}

- (void)setModifierFlags:(int64_t)a3
{
  self->_modifierFlags = a3;
}

- (void).cxx_destruct
{
}

@end