@interface HDClinicalIngestionDownloadAttachmentsOperation
- (void)main;
@end

@implementation HDClinicalIngestionDownloadAttachmentsOperation

- (void)main
{
  _HKInitializeLogging();
  v3 = (void *)HKLogHealthRecords;
  if (os_log_type_enabled(HKLogHealthRecords, OS_LOG_TYPE_DEFAULT))
  {
    v4 = v3;
    v5 = [(HDClinicalIngestionOperation *)self debugDescription];
    *(_DWORD *)buf = 138543362;
    v10 = v5;
    _os_log_impl(&dword_0, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Starting MedicalDownloadableAttachment Pipeline", buf, 0xCu);
  }
  v6 = [(HDClinicalIngestionOperation *)self profileExtension];
  v7 = [v6 downloadableAttachmentManager];

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_88520;
  v8[3] = &unk_1139C8;
  v8[4] = self;
  [v7 runMedicalDownloadableAttachmentPipelineWithCompletion:v8];
}

@end