@interface IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate
- (_TtCC19HealthRecordsDaemon34IssuerDirectoryDownloadTaskManagerP33_7AB94515F5C396F1FDF73A0A6286A3E442URLSessionNoCustomCertVerificationDelegate)init;
- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5;
@end

@implementation IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate

- (void)URLSession:(NSURLSession *)a3 didReceiveChallenge:(NSURLAuthenticationChallenge *)a4 completionHandler:(id)a5
{
  sub_22D0A93E0(0, (unint64_t *)&qword_26853ECE0, MEMORY[0x263F8F520], MEMORY[0x263F8D8F0]);
  MEMORY[0x270FA5388](v9 - 8);
  v11 = (char *)&v20 - v10;
  v12 = _Block_copy(a5);
  v13 = (void *)swift_allocObject();
  v13[2] = a3;
  v13[3] = a4;
  v13[4] = v12;
  v13[5] = self;
  uint64_t v14 = sub_22D2BCED0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_26853ECF0;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_26853F1B0;
  v16[5] = v15;
  v17 = a3;
  v18 = a4;
  v19 = self;
  sub_22D0CE69C((uint64_t)v11, (uint64_t)&unk_26853ED00, (uint64_t)v16);
  swift_release();
}

- (_TtCC19HealthRecordsDaemon34IssuerDirectoryDownloadTaskManagerP33_7AB94515F5C396F1FDF73A0A6286A3E442URLSessionNoCustomCertVerificationDelegate)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate();
  return [(IssuerDirectoryDownloadTaskManager.URLSessionNoCustomCertVerificationDelegate *)&v3 init];
}

@end