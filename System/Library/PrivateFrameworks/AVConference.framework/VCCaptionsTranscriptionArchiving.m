@interface VCCaptionsTranscriptionArchiving
+ (id)archivedTranscription:(id)a3 error:(id *)a4;
+ (id)unarchivedTranscriptionFromData:(id)a3 error:(id *)a4;
@end

@implementation VCCaptionsTranscriptionArchiving

+ (id)archivedTranscription:(id)a3 error:(id *)a4
{
  return (id)[MEMORY[0x1E4F28DB0] archivedDataWithRootObject:a3 requiringSecureCoding:1 error:a4];
}

+ (id)unarchivedTranscriptionFromData:(id)a3 error:(id *)a4
{
  v6 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  uint64_t v12 = objc_msgSend(v6, "setWithObjects:", v7, v8, v9, v10, v11, objc_opt_class(), 0);
  v13 = (void *)MEMORY[0x1E4F28DC0];

  return (id)[v13 _strictlyUnarchivedObjectOfClasses:v12 fromData:a3 error:a4];
}

@end