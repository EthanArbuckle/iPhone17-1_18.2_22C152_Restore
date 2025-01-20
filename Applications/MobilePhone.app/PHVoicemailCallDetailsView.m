@interface PHVoicemailCallDetailsView
- (NSDictionary)callOccurrence;
- (id)callOccurrences;
- (void)setCallOccurrence:(id)a3;
@end

@implementation PHVoicemailCallDetailsView

- (void)setCallOccurrence:(id)a3
{
  v5 = (NSDictionary *)a3;
  p_callOccurrence = &self->_callOccurrence;
  if (self->_callOccurrence != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_callOccurrence, a3);
    p_callOccurrence = (NSDictionary **)[(PHRecentCallDetailsView *)self loadSubviews];
    v5 = v7;
  }

  _objc_release_x1(p_callOccurrence, v5);
}

- (id)callOccurrences
{
  v2 = [(PHVoicemailCallDetailsView *)self callOccurrence];
  v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return v3;
}

- (NSDictionary)callOccurrence
{
  return self->_callOccurrence;
}

- (void).cxx_destruct
{
}

@end