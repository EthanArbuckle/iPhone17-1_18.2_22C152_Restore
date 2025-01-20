@interface SiriHintViewController
- (double)desiredHeightForWidth:(double)a3;
- (id)_attributedString;
- (id)_attributedStringForText:(id)a3 regions:(id)a4;
- (void)_handleHintViewTap:(id)a3;
- (void)loadView;
@end

@implementation SiriHintViewController

- (id)_attributedStringForText:(id)a3 regions:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  NSAttributedStringKey v39 = NSFontAttributeName;
  v7 = &CGRectGetMaxX_ptr;
  v8 = +[UIFont siriui_thinWeightBodySizeFont];
  v40 = v8;
  uint64_t v9 = +[NSDictionary dictionaryWithObjects:&v40 forKeys:&v39 count:1];

  v28 = (void *)v9;
  v29 = v5;
  id v30 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v5 attributes:v9];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v6;
  id v10 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v35;
    uint64_t v13 = SARegionPropertyHIGHLIGHTED_QUERY_PARAMValue;
    uint64_t v31 = SARegionPropertySUGGESTED_UTTERANCEValue;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        v16 = [v15 property];
        if (([v16 isEqualToString:v13] & 1) != 0
          || [v16 isEqualToString:v31])
        {
          v17 = NSFontAttributeName;
          uint64_t v18 = objc_msgSend(v7[129], "siriui_mediumWeightBodySizeFont");
          v19 = (void *)v18;
          if (NSFontAttributeName && v18)
          {
            [v15 start];
            v21 = uint64_t v20 = v12;
            id v33 = [v21 unsignedIntegerValue];
            v22 = [v15 length];
            uint64_t v23 = v13;
            id v24 = v11;
            id v25 = [v22 unsignedIntegerValue];

            uint64_t v12 = v20;
            v7 = &CGRectGetMaxX_ptr;
            id v26 = v25;
            id v11 = v24;
            uint64_t v13 = v23;
            objc_msgSend(v30, "addAttribute:value:range:", v17, v19, v33, v26);
          }
        }
        else
        {
          v19 = 0;
          v17 = 0;
        }
      }
      id v11 = [obj countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v11);
  }

  return v30;
}

- (id)_attributedString
{
  v3 = [(SiriHintViewController *)self aceObject];
  v4 = [v3 text];
  id v5 = [v3 regions];
  id v6 = [(SiriHintViewController *)self _attributedStringForText:v4 regions:v5];

  return v6;
}

- (double)desiredHeightForWidth:(double)a3
{
  double v5 = 0.0;
  if (([(SiriHintViewController *)self isVirgin] & 1) == 0)
  {
    id v6 = [(SiriHintViewController *)self _attributedString];
    +[SiriHintView sizeThatFitsString:v6 forWidth:a3];
    double v5 = v7;
  }
  return v5;
}

- (void)loadView
{
  if ([(SiriHintViewController *)self isVirgin])
  {
    double v5 = (SiriHintView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  }
  else
  {
    double v5 = -[SiriHintView initWithFrame:]([SiriHintView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v3 = [(SiriHintViewController *)self _attributedString];
    [(SiriHintView *)v5 setAttributedText:v3];

    id v4 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:self action:"_handleHintViewTap:"];
    [(SiriHintView *)v5 addGestureRecognizer:v4];
  }
  [(SiriHintViewController *)self setView:v5];
}

- (void)_handleHintViewTap:(id)a3
{
  id v4 = [(SiriHintViewController *)self aceObject];
  id v6 = [v4 commands];

  if ([v6 count])
  {
    double v5 = [(SiriHintViewController *)self delegate];
    [v5 siriViewController:self performAceCommands:v6];
  }
}

- (void).cxx_destruct
{
}

@end