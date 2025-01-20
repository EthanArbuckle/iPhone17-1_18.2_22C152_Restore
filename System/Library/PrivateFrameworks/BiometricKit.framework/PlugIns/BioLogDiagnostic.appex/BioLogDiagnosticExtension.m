@interface BioLogDiagnosticExtension
- (id)attachmentList;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation BioLogDiagnosticExtension

- (id)attachmentList
{
  return &__NSArray0__struct;
}

- (id)attachmentsForParameters:(id)a3
{
  v3 = +[BiometricKit manager];
  v4 = [v3 getLogs:1 withDetails:0];

  if (v4)
  {
    v5 = [v4 firstObject];
    v6 = +[DEAttachmentItem attachmentWithPath:v5];
    v9 = v6;
    v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    v7 = &__NSArray0__struct;
  }

  return v7;
}

@end