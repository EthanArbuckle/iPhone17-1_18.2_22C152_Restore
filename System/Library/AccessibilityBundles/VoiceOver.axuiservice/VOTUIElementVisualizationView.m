@interface VOTUIElementVisualizationView
- (VOTUIElementVisualizationView)initWithFrame:(CGRect)a3;
- (void)drawRect:(CGRect)a3;
- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5;
@end

@implementation VOTUIElementVisualizationView

- (VOTUIElementVisualizationView)initWithFrame:(CGRect)a3
{
  v14.receiver = self;
  v14.super_class = (Class)VOTUIElementVisualizationView;
  v3 = -[VOTUIElementVisualizationView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = +[UIColor clearColor];
  [(VOTUIElementVisualizationView *)v3 setBackgroundColor:v4];

  [(VOTUIElementVisualizationView *)v3 setOpaque:0];
  v5 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  numberLabel = v3->_numberLabel;
  v3->_numberLabel = v5;

  v7 = v3->_numberLabel;
  v8 = +[UIColor colorWithRed:0.0 green:255.0 blue:0.0 alpha:0.8];
  [(UILabel *)v3->_numberLabel setTextColor:v8];
  [(UILabel *)v7 setTextColor:v8];

  v9 = v3->_numberLabel;
  v10 = +[UIColor blackColor];
  [(UILabel *)v9 setShadowColor:v10];

  v11 = v3->_numberLabel;
  v12 = +[UIFont systemFontOfSize:18.0];
  [(UILabel *)v11 setFont:v12];

  return v3;
}

- (void)setElementFrames:(id)a3 labels:(id)a4 uiClasses:(id)a5
{
  v8 = (NSArray *)a3;
  v9 = (NSArray *)a4;
  v10 = (NSArray *)a5;
  frames = self->_frames;
  self->_frames = v8;
  v12 = v8;

  labels = self->_labels;
  self->_labels = v9;
  objc_super v14 = v9;

  uiClasses = self->_uiClasses;
  self->_uiClasses = v10;

  [(VOTUIElementVisualizationView *)self setNeedsDisplay];
}

- (void)drawRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  v8 = +[UIColor colorWithWhite:0.0 alpha:0.0];
  [v8 set];

  v24.origin.CGFloat x = x;
  v24.origin.CGFloat y = y;
  v24.size.CGFloat width = width;
  v24.size.CGFloat height = height;
  UIRectFill(v24);
  if ([(NSArray *)self->_frames count])
  {
    unint64_t v9 = 0;
    v17 = v19;
    do
    {
      if (v9 >= [(NSArray *)self->_labels count] || v9 >= [(NSArray *)self->_uiClasses count]) {
        break;
      }
      v10 = [(NSArray *)self->_frames objectAtIndexedSubscript:v9];
      CGRectFromString(v10);
      v11 = +[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:");
      [v11 setLineWidth:2.0];
      uint64_t v20 = 0;
      v21 = &v20;
      uint64_t v22 = 0x2050000000;
      v12 = (void *)qword_4BEA8;
      uint64_t v23 = qword_4BEA8;
      if (!qword_4BEA8)
      {
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v19[0] = sub_C95C;
        v19[1] = &unk_3D238;
        v19[2] = &v20;
        sub_C95C((uint64_t)v18);
        v12 = (void *)v21[3];
      }
      id v13 = v12;
      _Block_object_dispose(&v20, 8);
      objc_super v14 = [(NSArray *)self->_uiClasses objectAtIndexedSubscript:v9];
      id v15 = [v13 uiClassForName:v14];

      v16 = +[UIColor colorWithHue:(double)(uint64_t)v15 * 3.05263158 saturation:1.0 brightness:1.0 alpha:0.8];
      [v16 set];
      [v11 stroke];
      [(UILabel *)self->_numberLabel sizeToFit];
      [(UILabel *)self->_numberLabel frame];
      UIRectCenteredIntegralRect();
      -[UILabel drawTextInRect:](self->_numberLabel, "drawTextInRect:");

      ++v9;
    }
    while (v9 < [(NSArray *)self->_frames count]);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_uiClasses, 0);
  objc_storeStrong((id *)&self->_labels, 0);
  objc_storeStrong((id *)&self->_frames, 0);

  objc_storeStrong((id *)&self->_numberLabel, 0);
}

@end