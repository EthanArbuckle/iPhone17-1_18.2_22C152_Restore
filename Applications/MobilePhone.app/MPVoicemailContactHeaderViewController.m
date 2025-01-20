@interface MPVoicemailContactHeaderViewController
- (NSDictionary)callOccurrence;
- (id)generateDetailsView;
- (void)setCallOccurrence:(id)a3;
@end

@implementation MPVoicemailContactHeaderViewController

- (id)generateDetailsView
{
  v3 = -[PHRecentCallDetailsView initWithFrame:]([PHVoicemailCallDetailsView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v4 = [(MPVoicemailContactHeaderViewController *)self callOccurrence];
  [(PHVoicemailCallDetailsView *)v3 setCallOccurrence:v4];

  return v3;
}

- (NSDictionary)callOccurrence
{
  return self->_callOccurrence;
}

- (void)setCallOccurrence:(id)a3
{
}

- (void).cxx_destruct
{
}

@end