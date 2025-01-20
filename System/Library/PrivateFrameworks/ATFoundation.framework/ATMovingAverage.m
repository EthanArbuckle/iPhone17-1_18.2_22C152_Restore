@interface ATMovingAverage
- (ATMovingAverage)initWithWindow:(unint64_t)a3;
- (double)average;
- (unint64_t)window;
- (void)dealloc;
- (void)reset;
- (void)update:(double)a3;
@end

@implementation ATMovingAverage

- (unint64_t)window
{
  return self->_window;
}

- (double)average
{
  unint64_t window = self->_window;
  if (window >= self->_count) {
    unint64_t window = self->_count;
  }
  if (window)
  {
    values = self->_values;
    double v4 = 0.0;
    unint64_t v5 = window;
    do
    {
      double v6 = *values++;
      double v4 = v4 + v6;
      --v5;
    }
    while (v5);
  }
  else
  {
    double v4 = 0.0;
  }
  return v4 / (double)window;
}

- (void)reset
{
  unint64_t window = self->_window;
  if (window) {
    bzero(self->_values, 8 * window);
  }
  self->_count = 0;
}

- (void)update:(double)a3
{
  unint64_t count = self->_count;
  if (self->_index == self->_window) {
    unint64_t index = 0;
  }
  else {
    unint64_t index = self->_index;
  }
  self->_values[index] = a3;
  self->_unint64_t count = count + 1;
  self->_unint64_t index = index + 1;
}

- (void)dealloc
{
  free(self->_values);
  v3.receiver = self;
  v3.super_class = (Class)ATMovingAverage;
  [(ATMovingAverage *)&v3 dealloc];
}

- (ATMovingAverage)initWithWindow:(unint64_t)a3
{
  v8.receiver = self;
  v8.super_class = (Class)ATMovingAverage;
  double v4 = [(ATMovingAverage *)&v8 init];
  unint64_t v5 = v4;
  if (v4)
  {
    v4->_unint64_t window = a3;
    double v6 = (double *)malloc_type_malloc(8 * a3, 0x100004000313F17uLL);
    v5->_unint64_t count = 0;
    v5->_unint64_t index = 0;
    v5->_values = v6;
  }
  return v5;
}

@end