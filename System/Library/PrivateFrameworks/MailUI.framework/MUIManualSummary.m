@interface MUIManualSummary
- (BOOL)isEqual:(id)a3;
- (BOOL)requiresConfirmation;
- (MUIManualSummary)initWithSummary:(id)a3 requiresConfirmation:(BOOL)a4;
- (NSAttributedString)attributedString;
- (unint64_t)hash;
- (void)setAttributedString:(id)a3;
- (void)setRequiresConfirmation:(BOOL)a3;
@end

@implementation MUIManualSummary

- (MUIManualSummary)initWithSummary:(id)a3 requiresConfirmation:(BOOL)a4
{
  id v6 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MUIManualSummary;
  v7 = [(MUIManualSummary *)&v11 init];
  if (v7)
  {
    uint64_t v8 = [v6 copy];
    attributedString = v7->_attributedString;
    v7->_attributedString = (NSAttributedString *)v8;

    v7->_requiresConfirmation = a4;
  }

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (MUIManualSummary *)a3;
  if (v4 == self)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      id v6 = [(MUIManualSummary *)self attributedString];
      v7 = [(MUIManualSummary *)v5 attributedString];
      if (EFObjectsAreEqual())
      {
        BOOL v8 = [(MUIManualSummary *)self requiresConfirmation];
        BOOL v9 = v8 ^ [(MUIManualSummary *)v5 requiresConfirmation] ^ 1;
      }
      else
      {
        LOBYTE(v9) = 0;
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }

  return v9;
}

- (unint64_t)hash
{
  v3 = [(MUIManualSummary *)self attributedString];
  uint64_t v4 = [v3 hash];

  v5 = objc_msgSend(NSNumber, "numberWithBool:", -[MUIManualSummary requiresConfirmation](self, "requiresConfirmation"));
  unint64_t v6 = 33 * v4 + [v5 hash] + 1089;

  return v6;
}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void)setAttributedString:(id)a3
{
}

- (BOOL)requiresConfirmation
{
  return self->_requiresConfirmation;
}

- (void)setRequiresConfirmation:(BOOL)a3
{
  self->_requiresConfirmation = a3;
}

- (void).cxx_destruct
{
}

@end