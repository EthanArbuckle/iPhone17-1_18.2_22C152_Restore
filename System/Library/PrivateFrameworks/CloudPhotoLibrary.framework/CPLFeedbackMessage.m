@interface CPLFeedbackMessage
+ (id)feedbackType;
- (CPLFeedbackMessage)initWithLibraryIdentifier:(id)a3;
- (CPLServerFeedbackMessage)serverMessage;
- (NSString)feedbackType;
- (NSString)libraryIdentifier;
- (NSString)libraryIdentifierDescription;
@end

@implementation CPLFeedbackMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_feedbackType, 0);
  objc_storeStrong((id *)&self->_libraryIdentifier, 0);
  objc_storeStrong((id *)&self->_creationDate, 0);
}

- (NSString)feedbackType
{
  return self->_feedbackType;
}

- (NSString)libraryIdentifier
{
  return self->_libraryIdentifier;
}

- (CPLServerFeedbackMessage)serverMessage
{
  v3 = objc_alloc_init(CPLServerFeedbackMessage);
  v4 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  [(CPLServerFeedbackKeyAndValue *)v4 setKey:@"type"];
  [(CPLServerFeedbackKeyAndValue *)v4 setValue:self->_feedbackType];
  [(CPLServerFeedbackMessage *)v3 addKeysAndValues:v4];
  v5 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
  if (serverMessage_onceToken != -1) {
    dispatch_once(&serverMessage_onceToken, &__block_literal_global_3);
  }
  [(CPLServerFeedbackKeyAndValue *)v5 setKey:@"date"];
  v6 = [(id)serverMessage_formatter stringFromDate:self->_creationDate];
  [(CPLServerFeedbackKeyAndValue *)v5 setValue:v6];

  [(CPLServerFeedbackMessage *)v3 addKeysAndValues:v5];
  if (![(NSString *)self->_libraryIdentifier isEqualToString:@"SystemLibrary"])
  {
    v7 = objc_alloc_init(CPLServerFeedbackKeyAndValue);
    [(CPLServerFeedbackKeyAndValue *)v7 setKey:@"library"];
    v8 = [(CPLFeedbackMessage *)self libraryIdentifierDescription];
    [(CPLServerFeedbackKeyAndValue *)v7 setValue:v8];

    [(CPLServerFeedbackMessage *)v3 addKeysAndValues:v7];
  }

  return v3;
}

void __35__CPLFeedbackMessage_serverMessage__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  v1 = (void *)serverMessage_formatter;
  serverMessage_formatter = (uint64_t)v0;

  id v2 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  [(id)serverMessage_formatter setLocale:v2];
  [(id)serverMessage_formatter setDateFormat:@"yyyy-MM-dd'T'HH:mm:ssZZZZZ"];
}

- (NSString)libraryIdentifierDescription
{
  BOOL v3 = [(NSString *)self->_libraryIdentifier hasSuffix:@"Library"];
  libraryIdentifier = self->_libraryIdentifier;
  if (v3)
  {
    v5 = [(NSString *)libraryIdentifier substringToIndex:[(NSString *)libraryIdentifier length] - 7];
    v6 = [v5 lowercaseString];
  }
  else
  {
    v6 = [(NSString *)libraryIdentifier lowercaseString];
  }
  return (NSString *)v6;
}

- (CPLFeedbackMessage)initWithLibraryIdentifier:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CPLFeedbackMessage;
  v5 = [(CPLFeedbackMessage *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    libraryIdentifier = v5->_libraryIdentifier;
    v5->_libraryIdentifier = (NSString *)v6;

    uint64_t v8 = [(id)objc_opt_class() feedbackType];
    feedbackType = v5->_feedbackType;
    v5->_feedbackType = (NSString *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    creationDate = v5->_creationDate;
    v5->_creationDate = (NSDate *)v10;
  }
  return v5;
}

+ (id)feedbackType
{
  id v4 = [MEMORY[0x1E4F28B00] currentHandler];
  v5 = [NSString stringWithUTF8String:"/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Engine/Feedback/CPLFeedbackMessage.m"];
  uint64_t v6 = NSStringFromSelector(a2);
  [v4 handleFailureInMethod:a2, a1, v5, 67, @"%@ should be overriden", v6 object file lineNumber description];

  abort();
}

@end