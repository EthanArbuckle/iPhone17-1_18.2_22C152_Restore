@interface DTSForceGestureRecognizer
- (void)reset;
- (void)setState:(int64_t)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation DTSForceGestureRecognizer

- (void)reset
{
  v3.receiver = self;
  v3.super_class = (Class)DTSForceGestureRecognizer;
  [(DTSForceGestureRecognizer *)&v3 reset];
  self->_startTime = 0.0;
  self->_hasSufficientForce = 0;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)DTSForceGestureRecognizer;
  id v6 = a3;
  [(DTSForceGestureRecognizer *)&v9 touchesBegan:v6 withEvent:a4];
  v7 = objc_msgSend(v6, "anyObject", v9.receiver, v9.super_class);

  [v7 timestamp];
  self->_startTime = v8;
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v6 = a3;
  v23.receiver = self;
  v23.super_class = (Class)DTSForceGestureRecognizer;
  [(DTSForceGestureRecognizer *)&v23 touchesMoved:v6 withEvent:a4];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v19 + 1) + 8 * i), "force", (void)v19);
        if (!self->_hasSufficientForce)
        {
          self->_hasSufficientForce = v12 >= 2.0;
          goto LABEL_11;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v19 objects:v24 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  v13 = [v7 anyObject];
  [v13 timestamp];
  double v15 = v14;
  double startTime = self->_startTime;

  unint64_t v17 = [(DTSForceGestureRecognizer *)self state];
  if (!self->_hasSufficientForce && v15 - startTime > 0.2 && v17 <= 1) {
    -[DTSForceGestureRecognizer setState:](self, "setState:", 5, v15 - startTime);
  }
}

- (void)setState:(int64_t)a3
{
  if (a3 == 1)
  {
    if (self->_hasSufficientForce) {
      a3 = 1;
    }
    else {
      a3 = 5;
    }
  }
  v3.receiver = self;
  v3.super_class = (Class)DTSForceGestureRecognizer;
  [(DTSForceGestureRecognizer *)&v3 setState:a3];
}

@end