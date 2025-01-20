@interface CSDiagnosticeExtension
- (id)_sortedAttachmentListWithPath:(id)a3 regularExpressionPatten:(id)a4;
- (id)attachmentsForParameters:(id)a3;
@end

@implementation CSDiagnosticeExtension

- (id)_sortedAttachmentListWithPath:(id)a3 regularExpressionPatten:(id)a4
{
  id v6 = a4;
  v7 = +[NSURL fileURLWithPath:a3];
  v8 = +[NSRegularExpression regularExpressionWithPattern:v6 options:1 error:0];

  v9 = [(CSDiagnosticeExtension *)self filesInDir:v7 matchingPattern:v8 excludingPattern:0];

  v10 = [v9 sortedArrayUsingComparator:&stru_1000040F8];
  id v11 = [v10 count];
  if ((unint64_t)v11 >= 0xA) {
    uint64_t v12 = 10;
  }
  else {
    uint64_t v12 = (uint64_t)v11;
  }
  v13 = objc_msgSend(v10, "subarrayWithRange:", 0, v12);

  return v13;
}

- (id)attachmentsForParameters:(id)a3
{
  id v4 = a3;
  v5 = +[NSMutableArray array];
  id v6 = os_log_create("com.apple.corespeech", "DiagnosticExtension");
  v7 = [v4 objectForKeyedSubscript:@"DEExtensionAttachmentsParamConsentProvidedKey"];

  if (v7 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && [v7 BOOLValue])
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v16 = 136315394;
      v17 = "-[CSDiagnosticeExtension attachmentsForParameters:]";
      __int16 v18 = 2112;
      CFStringRef v19 = @"Collecting 'CoreSpeech Logs'";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v16, 0x16u);
    }
    if (qword_100008158 != -1) {
      dispatch_once(&qword_100008158, &stru_100004138);
    }
    if (byte_100008150)
    {
      v8 = [(CSDiagnosticeExtension *)self _sortedAttachmentListWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/VoiceTrigger/audio" regularExpressionPatten:@".*\\.(wav)$"];
      [v5 addObjectsFromArray:v8];

      v9 = [(CSDiagnosticeExtension *)self _sortedAttachmentListWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs" regularExpressionPatten:@".*\\.(wav)$"];
      [v5 addObjectsFromArray:v9];

      v10 = [(CSDiagnosticeExtension *)self _sortedAttachmentListWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs" regularExpressionPatten:@".*\\.(opx)$"];
      [v5 addObjectsFromArray:v10];

      id v11 = [(CSDiagnosticeExtension *)self _sortedAttachmentListWithPath:@"/private/var/mobile/Library/Logs/CrashReporter/Assistant/MHLog" regularExpressionPatten:@".*\\.(wav)$"];
      [v5 addObjectsFromArray:v11];

      CFStringRef v12 = @"/private//var/mobile/Library/Logs/CrashReporter/Assistant/AVVCCapture";
      CFStringRef v13 = @".*\\.(caf)$";
    }
    else
    {
      CFStringRef v12 = @"/private/var/mobile/Library/Logs/CrashReporter/Assistant/SpeechLogs";
      CFStringRef v13 = @"PHS\\-.*\\.(wav)$";
    }
    v14 = [(CSDiagnosticeExtension *)self _sortedAttachmentListWithPath:v12 regularExpressionPatten:v13];
    [v5 addObjectsFromArray:v14];
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v16 = 136315394;
    v17 = "-[CSDiagnosticeExtension attachmentsForParameters:]";
    __int16 v18 = 2112;
    CFStringRef v19 = @"Not collecting 'CoreSpeech Logs'";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s %@", (uint8_t *)&v16, 0x16u);
  }

  return v5;
}

@end