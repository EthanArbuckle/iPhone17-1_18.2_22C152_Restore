@interface CKRecordActionMenuItem
- (BOOL)wasSelected;
- (NSDate)dateSelected;
- (void)setDateSelected:(id)a3;
- (void)setSelected:(BOOL)a3 animated:(BOOL)a4;
- (void)setWasSelected:(BOOL)a3;
- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4;
@end

@implementation CKRecordActionMenuItem

- (void)setSelected:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  if ([(CKActionMenuItem *)self isSelected] != a3)
  {
    v8.receiver = self;
    v8.super_class = (Class)CKRecordActionMenuItem;
    [(CKActionMenuItem *)&v8 setSelected:v5 animated:v4];
    if (v5)
    {
      v7 = [MEMORY[0x1E4F1C9C8] date];
      [(CKRecordActionMenuItem *)self setDateSelected:v7];
    }
    else
    {
      [(CKRecordActionMenuItem *)self setDateSelected:0];
    }
  }
}

- (void)updateForState:(int64_t)a3 touchInside:(BOOL)a4
{
  BOOL v4 = a4;
  switch(a3)
  {
    case 1:
      [(CKRecordActionMenuItem *)self setWasSelected:[(CKActionMenuItem *)self isSelected]];
      goto LABEL_3;
    case 2:
LABEL_3:
      [(CKActionMenuItem *)self setHighlighted:v4 animated:1];
      if (v4
        && ![(CKActionMenuItem *)self isSelected]
        && ![(CKRecordActionMenuItem *)self wasSelected])
      {
        [(CKRecordActionMenuItem *)self setSelected:1 animated:1];
        [(CKActionMenuItem *)self sendAction];
      }
      break;
    case 3:
      [(CKActionMenuItem *)self setHighlighted:0 animated:1];
      if (v4 && [(CKActionMenuItem *)self isSelected])
      {
        id v9 = [(CKRecordActionMenuItem *)self dateSelected];
        if ([(CKRecordActionMenuItem *)self wasSelected]
          || v9
          && ([MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate],
              double v7 = v6,
              [v9 timeIntervalSinceReferenceDate],
              v7 - v8 >= 0.25))
        {
          [(CKRecordActionMenuItem *)self setSelected:0 animated:1];
          [(CKActionMenuItem *)self sendAction];
        }
      }
      break;
    case 4:
      [(CKActionMenuItem *)self setHighlighted:0 animated:0];
      break;
    default:
      return;
  }
}

- (BOOL)wasSelected
{
  return self->_wasSelected;
}

- (void)setWasSelected:(BOOL)a3
{
  self->_wasSelected = a3;
}

- (NSDate)dateSelected
{
  return self->_dateSelected;
}

- (void)setDateSelected:(id)a3
{
}

- (void).cxx_destruct
{
}

@end