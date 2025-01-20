@interface URLSessionCertVerificationDelegate
- (_TtC19HealthRecordsDaemon34URLSessionCertVerificationDelegate)init;
- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5;
@end

@implementation URLSessionCertVerificationDelegate

- (void)URLSession:(id)a3 didReceiveChallenge:(id)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  _Block_copy(v8);
  id v9 = a3;
  id v10 = a4;
  v11 = self;
  sub_22D10DC08(v10, v11, (uint64_t)v8);
  _Block_release(v8);
  _Block_release(v8);
}

- (_TtC19HealthRecordsDaemon34URLSessionCertVerificationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for URLSessionCertVerificationDelegate();
  return [(URLSessionCertVerificationDelegate *)&v3 init];
}

@end