@interface CAUITransportButton
+ (Class)layerClass;
- (CAUITransportButton)initWithCoder:(id)a3;
- (CAUITransportButton)initWithFrame:(CGRect)a3;
- (CGColor)fillColor;
- (CGPath)newPathRefForStyle:(int)a3;
- (int)drawingStyle;
- (void)flash;
- (void)setDrawingStyle:(int)a3;
- (void)setFillColor:(CGColor *)a3;
- (void)touchesBegan:(id)a3 withEvent:(id)a4;
- (void)touchesCancelled:(id)a3 withEvent:(id)a4;
- (void)touchesEnded:(id)a3 withEvent:(id)a4;
@end

@implementation CAUITransportButton

- (CAUITransportButton)initWithCoder:(id)a3
{
  v22.receiver = self;
  v22.super_class = (Class)CAUITransportButton;
  v3 = [(CAUITransportButton *)&v22 initWithCoder:a3];
  v4 = v3;
  if (v3)
  {
    p_imageRect = &v3->imageRect;
    [(CAUITransportButton *)v3 bounds];
    *(void *)&p_imageRect->origin.x = v6;
    v4->imageRect.origin.y = v7;
    v4->imageRect.size.double width = v8;
    v4->imageRect.size.double height = v9;
    [(CAUITransportButton *)v4 bounds];
    double width = 24.0;
    double v12 = 24.0 - v11;
    [(CAUITransportButton *)v4 bounds];
    double v14 = 24.0 - v13;
    if (v12 > 0.0 || v14 > 0.0)
    {
      if (v12 <= 0.0) {
        double width = v4->imageRect.size.width;
      }
      double height = 24.0;
      if (v14 <= 0.0) {
        double height = v4->imageRect.size.height;
      }
      [(CAUITransportButton *)v4 frame];
      double v17 = v16;
      if (v12 > 0.0)
      {
        float v18 = v16 + v12 * -0.5;
        double v17 = roundf(v18);
      }
      [(CAUITransportButton *)v4 frame];
      if (v14 > 0.0)
      {
        float v20 = v19 + v14 * -0.5;
        double v19 = roundf(v20);
      }
      -[CAUITransportButton setFrame:](v4, "setFrame:", v17, v19, width, height);
      -[CAUITransportButton setBounds:](v4, "setBounds:", 0.0, 0.0, width, height);
    }
  }
  return v4;
}

- (CAUITransportButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v23.receiver = self;
  v23.super_class = (Class)CAUITransportButton;
  v5 = -[CAUITransportButton initWithFrame:](&v23, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  v6 = v5;
  if (v5)
  {
    p_imageRect = &v5->imageRect;
    [(CAUITransportButton *)v5 bounds];
    double v10 = v9;
    *(void *)&p_imageRect->origin.x = v11;
    v6->imageRect.origin.y = v12;
    v6->imageRect.size.double width = v9;
    v6->imageRect.size.double height = v8;
    double v13 = 24.0 - width;
    double v14 = 24.0 - height;
    if (24.0 - width > 0.0 || v14 > 0.0)
    {
      if (v14 <= 0.0) {
        double v15 = v8;
      }
      else {
        double v15 = 24.0;
      }
      [(CAUITransportButton *)v6 frame];
      double v17 = v16;
      if (v13 <= 0.0) {
        double v18 = v10;
      }
      else {
        double v18 = 24.0;
      }
      if (v13 > 0.0)
      {
        float v19 = v16 + v13 * -0.5;
        double v17 = roundf(v19);
      }
      [(CAUITransportButton *)v6 frame];
      if (v14 > 0.0)
      {
        float v21 = v20 + v14 * -0.5;
        double v20 = roundf(v21);
      }
      -[CAUITransportButton setFrame:](v6, "setFrame:", v17, v20, v18, v15);
      -[CAUITransportButton setBounds:](v6, "setBounds:", 0.0, 0.0, v18, v15);
    }
  }
  return v6;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  if (![a4 type]) {
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x263F825C8], "colorWithCGColor:", objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "fillColor")), "colorWithAlphaComponent:", 0.5), "CGColor"));
  }
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  [(CAUITransportButton *)&v7 touchesBegan:a3 withEvent:a4];
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  if (![a4 type]) {
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", self->fillColor);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  [(CAUITransportButton *)&v7 touchesEnded:a3 withEvent:a4];
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  if (![a4 type]) {
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setFillColor:", self->fillColor);
  }
  v7.receiver = self;
  v7.super_class = (Class)CAUITransportButton;
  [(CAUITransportButton *)&v7 touchesEnded:a3 withEvent:a4];
}

- (void)setDrawingStyle:(int)a3
{
  if (self->drawingStyle != a3)
  {
    self->drawingStyle = a3;
    v5 = -[CAUITransportButton newPathRefForStyle:](self, "newPathRefForStyle:");
    objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "setPath:", v5);
    CGPathRelease(v5);
    -[CAUITransportButton setBackgroundColor:](self, "setBackgroundColor:", [MEMORY[0x263F825C8] clearColor]);
    if (a3 == 4)
    {
      objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "removeAllAnimations");
      v6 = (void *)MEMORY[0x263F82E00];
      uint64_t v9 = MEMORY[0x263EF8330];
      uint64_t v10 = 3221225472;
      double v11 = __39__CAUITransportButton_setDrawingStyle___block_invoke_2;
      CGFloat v12 = &unk_2644B01F0;
      double v13 = self;
      double v7 = 1.0;
      double v8 = &v9;
    }
    else
    {
      if (a3 != 5)
      {
LABEL_7:
        [(CAUITransportButton *)self setNeedsDisplay];
        return;
      }
      v6 = (void *)MEMORY[0x263F82E00];
      uint64_t v14 = MEMORY[0x263EF8330];
      uint64_t v15 = 3221225472;
      double v16 = __39__CAUITransportButton_setDrawingStyle___block_invoke;
      double v17 = &unk_2644B01F0;
      double v18 = self;
      double v7 = 1.0;
      double v8 = &v14;
    }
    objc_msgSend(v6, "animateWithDuration:delay:options:animations:completion:", 196608, v8, 0, v7, 0.0, v9, v10, v11, v12, v13, v14, v15, v16, v17, v18);
    goto LABEL_7;
  }
}

uint64_t __39__CAUITransportButton_setDrawingStyle___block_invoke(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setStrokeColor:", *(void *)(*(void *)(a1 + 32) + 752));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setFillColor:", *(void *)(*(void *)(a1 + 32) + 752));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setLineWidth:", 0.5);
  v2 = *(void **)(a1 + 32);

  return [v2 flash];
}

uint64_t __39__CAUITransportButton_setDrawingStyle___block_invoke_2(uint64_t a1)
{
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setStrokeColor:", objc_msgSend((id)objc_msgSend(MEMORY[0x263F825C8], "clearColor"), "CGColor"));
  objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "layer"), "setFillColor:", *(void *)(*(void *)(a1 + 32) + 752));
  v2 = (void *)[*(id *)(a1 + 32) layer];

  return [v2 setLineWidth:0.0];
}

- (int)drawingStyle
{
  return self->drawingStyle;
}

- (void)setFillColor:(CGColor *)a3
{
  CGColorRetain(a3);
  CGColorRelease(self->fillColor);
  self->fillColor = a3;
  v5 = (void *)[(CAUITransportButton *)self layer];

  [v5 setFillColor:a3];
}

- (CGColor)fillColor
{
  return self->fillColor;
}

- (void)flash
{
  v3 = objc_msgSend((id)objc_msgSend(MEMORY[0x263F825C8], "colorWithCGColor:", self->fillColor), "colorWithAlphaComponent:", 0.2);
  [MEMORY[0x263F158F8] begin];
  v4 = (void *)[MEMORY[0x263F15760] animationWithKeyPath:@"fillColor"];
  objc_msgSend(v4, "setFromValue:", objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "fillColor"));
  objc_msgSend(v4, "setToValue:", objc_msgSend(v3, "CGColor"));
  [v4 setDuration:2.0];
  [v4 setRepeatCount:0.0];
  [v4 setAutoreverses:1];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __28__CAUITransportButton_flash__block_invoke;
  v5[3] = &unk_2644B01F0;
  v5[4] = self;
  [MEMORY[0x263F158F8] setCompletionBlock:v5];
  objc_msgSend((id)-[CAUITransportButton layer](self, "layer"), "addAnimation:forKey:", v4, @"animateStrokeColor");
  [MEMORY[0x263F158F8] commit];
}

_DWORD *__28__CAUITransportButton_flash__block_invoke(uint64_t a1)
{
  result = *(_DWORD **)(a1 + 32);
  if (result[186] == 5) {
    return (_DWORD *)[result flash];
  }
  return result;
}

- (CGPath)newPathRefForStyle:(int)a3
{
  p_imageRect = &self->imageRect;
  double width = self->imageRect.size.width;
  double height = self->imageRect.size.height;
  if (width >= height) {
    double v6 = self->imageRect.size.height;
  }
  else {
    double v6 = self->imageRect.size.width;
  }
  switch(a3)
  {
    case 1:
      Mutable = CGPathCreateMutable();
      float v13 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      CGFloat v14 = roundf(v13);
      float v15 = v6 * 0.857;
      CGFloat v16 = roundf(v15);
      v42.origin.x = 0.0;
      v42.origin.y = v14;
      v42.size.double width = v6 * 0.062;
      v42.size.double height = v16;
      CGPathAddRoundedRect(Mutable, 0, v42, v6 * 0.026 * 0.5, v6 * 0.026 * 0.5);
      CGFloat v17 = v6 * 0.0631 * 0.5;
      double v18 = v6 * 0.062 + v6 * 0.006;
      CGFloat v19 = 2.0943951;
      CGPathAddArc(Mutable, 0, v18 + v17, v16 * 0.5 + v14, v17, 2.0943951, 4.1887902, 0);
      CGPathAddArc(Mutable, 0, v6 * 0.699 + v18 - v17, v17 + v14, v17, 4.1887902, 0.0, 0);
      double v20 = v16 + v14 - v17;
      CGFloat v21 = 0.0;
      objc_super v22 = Mutable;
      double v23 = v6 * 0.699 + v18 - v17;
      double v24 = v17;
      goto LABEL_12;
    case 2:
      Mutable = CGPathCreateMutable();
      CGFloat v25 = v6 * 0.2776;
      float v26 = (p_imageRect->size.width + v6 * -0.7452) * 0.5;
      CGFloat v27 = roundf(v26);
      float v28 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      CGFloat v29 = roundf(v28);
      CGFloat v30 = v6 * 0.0397 * 0.5;
      float v31 = v6 * 0.857;
      CGFloat v32 = roundf(v31);
      v43.origin.x = v27;
      v43.origin.y = v29;
      v43.size.double width = v25;
      v43.size.double height = v32;
      CGPathAddRoundedRect(Mutable, 0, v43, v30, v30);
      float v33 = p_imageRect->size.width - v27 - v25;
      v44.origin.x = roundf(v33);
      v44.origin.y = v29;
      v44.size.double width = v25;
      v44.size.double height = v32;
      CGPathAddRoundedRect(Mutable, 0, v44, v30, v30);
      return Mutable;
    case 3:
      Mutable = CGPathCreateMutable();
      float v34 = (p_imageRect->size.width - v6 * 0.6538) * 0.5;
      double v35 = roundf(v34);
      float v36 = (p_imageRect->size.height - v6 * 0.857) * 0.5;
      double v37 = roundf(v36);
      CGFloat v38 = v6 * 0.0631 * 0.5;
      float v39 = v6 * 0.857;
      double v40 = roundf(v39);
      CGFloat v19 = 3.14159265;
      CGPathAddArc(Mutable, 0, v38 + v35, v38 + v37, v38, 3.14159265, 5.23598776, 0);
      CGPathAddArc(Mutable, 0, v6 * 0.6538 + v35 - v38, v40 * 0.5 + v37, v38, 5.23598776, 1.04719755, 0);
      double v20 = v40 + v37 - v38;
      objc_super v22 = Mutable;
      double v23 = v38 + v35;
      double v24 = v38;
      CGFloat v21 = 1.04719755;
LABEL_12:
      CGPathAddArc(v22, 0, v23, v20, v24, v21, v19, 0);
      CGPathCloseSubpath(Mutable);
      return Mutable;
    case 4:
    case 5:
      double v8 = (width - v6 * 0.7825) * 0.5;
      double v9 = (height - v6 * 0.7825) * 0.5;
      double v7 = v6 * 0.7825;
      double v10 = v6 * 0.7825;
      return CGPathCreateWithEllipseInRect(*(CGRect *)&v8, 0);
    default:
      return 0;
  }
}

@end