@interface AKTapGestureRecognizer
- (BOOL)penGestureDetected;
- (void)_checkTouchesForStylus:(id)a3;
- (void)reset;
- (void)setPenGestureDetected:(BOOL)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
- (void)touchesMoved:(id)a3 withEvent:(id)a4;
@end

@implementation AKTapGestureRecognizer

- (void)reset
{
  [(AKTapGestureRecognizer *)self setPenGestureDetected:0];
  v3.receiver = self;
  v3.super_class = (Class)AKTapGestureRecognizer;
  [(AKTapGestureRecognizer *)&v3 reset];
}

- (void)_checkTouchesForStylus:(id)a3
{
  id v4 = [a3 anyObject];
  -[AKTapGestureRecognizer setPenGestureDetected:](self, "setPenGestureDetected:", [v4 type] == 2);
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AKTapGestureRecognizer *)self _checkTouchesForStylus:v7];
  v8.receiver = self;
  v8.super_class = (Class)AKTapGestureRecognizer;
  [(AKTapGestureRecognizer *)&v8 touchesBegan:v7 withEvent:v6];
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AKTapGestureRecognizer *)self _checkTouchesForStylus:v7];
  v8.receiver = self;
  v8.super_class = (Class)AKTapGestureRecognizer;
  [(AKTapGestureRecognizer *)&v8 touchesMoved:v7 withEvent:v6];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  v4.receiver = self;
  v4.super_class = (Class)AKTapGestureRecognizer;
  [(AKTapGestureRecognizer *)&v4 touchesEnded:a3 withEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  [(AKTapGestureRecognizer *)self setPenGestureDetected:0];
  v8.receiver = self;
  v8.super_class = (Class)AKTapGestureRecognizer;
  [(AKTapGestureRecognizer *)&v8 touchesCancelled:v7 withEvent:v6];
}

- (BOOL)penGestureDetected
{
  return self->_penGestureDetected;
}

- (void)setPenGestureDetected:(BOOL)a3
{
  self->_penGestureDetected = a3;
}

@end