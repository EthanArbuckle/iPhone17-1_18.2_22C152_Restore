@interface _SFReaderCustomProtocols
+ (OpaqueJSScript)readerUserInterfaceScriptForContext:(OpaqueJSContext *)a3;
+ (__CFString)registerReaderCustomProtocols;
+ (void)registerReaderCustomProtocols;
@end

@implementation _SFReaderCustomProtocols

+ (__CFString)registerReaderCustomProtocols
{
  return @"safari-reader";
}

+ (void)registerReaderCustomProtocols
{
  SafariShared::TranslatedFileURLProtocol::registerProtocol();

  SafariShared::TranslatedFileURLProtocol::registerProtocol();
}

+ (OpaqueJSScript)readerUserInterfaceScriptForContext:(OpaqueJSContext *)a3
{
  {
    JSContextGetGroup(a3);
    +[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:]::userInterfaceScript = JSScriptCreateReferencingImmortalASCIIText();
  }
  return (OpaqueJSScript *)+[_SFReaderCustomProtocols readerUserInterfaceScriptForContext:]::userInterfaceScript;
}

@end