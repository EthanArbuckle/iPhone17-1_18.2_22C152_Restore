@interface AXResultRowAccessibilityElement
- (AXResultRowAccessibilityElement)initWithAccessibilityContainer:(id)a3 label1:(id)a4 label2:(id)a5 label3:(id)a6;
- (CGRect)accessibilityFrame;
@end

@implementation AXResultRowAccessibilityElement

- (AXResultRowAccessibilityElement)initWithAccessibilityContainer:(id)a3 label1:(id)a4 label2:(id)a5 label3:(id)a6
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v17.receiver = self;
  v17.super_class = (Class)AXResultRowAccessibilityElement;
  v14 = [(AXResultRowAccessibilityElement *)&v17 initWithAccessibilityContainer:a3];
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_label1, a4);
    objc_storeStrong((id *)&v15->_label2, a5);
    objc_storeStrong((id *)&v15->_label3, a6);
  }

  return v15;
}

- (CGRect)accessibilityFrame
{
  v3 = [(AXResultRowAccessibilityElement *)self accessibilityContainer];
  NSClassFromString(&cfstr_Uitableviewcel.isa);
  if (objc_opt_isKindOfClass())
  {
    uint64_t v4 = [(UIView *)v3 safeValueForKey:@"realTableViewCell"];

    v3 = (UIView *)v4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(UILabel *)self->_label1 frame];
    double v6 = v5;
    double v8 = v7;
    double v10 = v9;
    double v12 = v11;
    id v13 = [(UILabel *)self->_label1 superview];
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
    CGFloat v62 = v15;
    CGFloat v63 = v14;
    CGFloat v60 = v17;
    CGFloat v61 = v16;

    [(UILabel *)self->_label2 frame];
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    v26 = [(UILabel *)self->_label2 superview];
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v26, v19, v21, v23, v25);
    CGFloat v28 = v27;
    CGFloat v30 = v29;
    CGFloat v32 = v31;
    CGFloat v34 = v33;

    [(UILabel *)self->_label3 frame];
    double v36 = v35;
    double v38 = v37;
    double v40 = v39;
    double v42 = v41;
    v43 = [(UILabel *)self->_label3 superview];
    -[UIView convertRect:fromView:](v3, "convertRect:fromView:", v43, v36, v38, v40, v42);
    CGFloat v45 = v44;
    CGFloat v47 = v46;
    CGFloat v49 = v48;
    CGFloat v51 = v50;

    v65.origin.CGFloat y = v62;
    v65.origin.CGFloat x = v63;
    v65.size.CGFloat height = v60;
    v65.size.CGFloat width = v61;
    v70.origin.CGFloat x = v28;
    v70.origin.CGFloat y = v30;
    v70.size.CGFloat width = v32;
    v70.size.CGFloat height = v34;
    CGRect v66 = CGRectUnion(v65, v70);
    v71.origin.CGFloat x = v45;
    v71.origin.CGFloat y = v47;
    v71.size.CGFloat width = v49;
    v71.size.CGFloat height = v51;
    CGRect v67 = CGRectUnion(v66, v71);
    CGRect v68 = UIAccessibilityConvertFrameToScreenCoordinates(v67, v3);
  }
  else
  {
    v64.receiver = self;
    v64.super_class = (Class)AXResultRowAccessibilityElement;
    [(AXResultRowAccessibilityElement *)&v64 accessibilityFrame];
  }
  CGFloat x = v68.origin.x;
  CGFloat y = v68.origin.y;
  CGFloat width = v68.size.width;
  CGFloat height = v68.size.height;

  double v56 = x;
  double v57 = y;
  double v58 = width;
  double v59 = height;
  result.size.CGFloat height = v59;
  result.size.CGFloat width = v58;
  result.origin.CGFloat y = v57;
  result.origin.CGFloat x = v56;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label3, 0);
  objc_storeStrong((id *)&self->_label2, 0);

  objc_storeStrong((id *)&self->_label1, 0);
}

@end