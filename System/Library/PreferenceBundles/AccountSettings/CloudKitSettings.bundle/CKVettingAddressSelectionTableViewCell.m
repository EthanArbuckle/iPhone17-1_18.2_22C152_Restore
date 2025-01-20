@interface CKVettingAddressSelectionTableViewCell
- (NSString)email;
- (NSString)number;
- (NSString)participantID;
- (UIActivityIndicatorView)spinner;
- (id)address;
- (void)clearSpinner;
- (void)deselect;
- (void)select;
- (void)setEmail:(id)a3;
- (void)setNumber:(id)a3;
- (void)setParticipantID:(id)a3;
- (void)setSpinner:(id)a3;
- (void)startSpinner;
@end

@implementation CKVettingAddressSelectionTableViewCell

- (void)clearSpinner
{
  v3 = [(CKVettingAddressSelectionTableViewCell *)self spinner];
  [v3 stopAnimating];

  [(CKVettingAddressSelectionTableViewCell *)self setAccessoryView:0];
}

- (void)select
{
  [(CKVettingAddressSelectionTableViewCell *)self clearSpinner];
  [(CKVettingAddressSelectionTableViewCell *)self setAccessoryType:3];

  [(CKVettingAddressSelectionTableViewCell *)self setSelected:1 animated:1];
}

- (void)deselect
{
  [(CKVettingAddressSelectionTableViewCell *)self clearSpinner];
  [(CKVettingAddressSelectionTableViewCell *)self setAccessoryType:0];

  [(CKVettingAddressSelectionTableViewCell *)self setSelected:0 animated:1];
}

- (void)startSpinner
{
  v3 = [(CKVettingAddressSelectionTableViewCell *)self accessoryView];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v5 = [(CKVettingAddressSelectionTableViewCell *)self accessoryView];
  }
  else
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v5 setHidesWhenStopped:1];
  }
  [(CKVettingAddressSelectionTableViewCell *)self setAccessoryView:v5];
  [(CKVettingAddressSelectionTableViewCell *)self setSpinner:v5];
  [v5 startAnimating];
}

- (id)address
{
  v4 = [(CKVettingAddressSelectionTableViewCell *)self email];
  id v5 = [v4 length];

  if (v5)
  {
    v6 = [(CKVettingAddressSelectionTableViewCell *)self email];
  }
  else
  {
    v7 = [(CKVettingAddressSelectionTableViewCell *)self number];
    id v8 = [v7 length];

    if (v8)
    {
      v6 = [(CKVettingAddressSelectionTableViewCell *)self number];
    }
    else
    {
      v9 = +[NSAssertionHandler currentHandler];
      [v9 handleFailureInMethod:a2, self, @"CKVettingAddressSelectionController.m", 100, @"Vetting cell without email or phone number: %@", self object file lineNumber description];

      v6 = &stru_14C08;
    }
  }

  return v6;
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
}

- (NSString)participantID
{
  return self->_participantID;
}

- (void)setParticipantID:(id)a3
{
}

- (NSString)email
{
  return self->_email;
}

- (void)setEmail:(id)a3
{
}

- (NSString)number
{
  return self->_number;
}

- (void)setNumber:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_number, 0);
  objc_storeStrong((id *)&self->_email, 0);
  objc_storeStrong((id *)&self->_participantID, 0);

  objc_storeStrong((id *)&self->_spinner, 0);
}

@end