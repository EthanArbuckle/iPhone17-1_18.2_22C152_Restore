@interface NLResourceWrapper
+ (id)copyAssetURLWithLocale:(id)a3 contentType:(id)a4 contentName:(id)a5;
@end

@implementation NLResourceWrapper

+ (id)copyAssetURLWithLocale:(id)a3 contentType:(id)a4 contentName:(id)a5
{
  CoreNLP::Resource::getAssetResource((CoreNLP::Resource *)a3, (const __CFLocale *)a4, (const __CFString *)a5, 0, &v9);
  if (!v9) {
    return 0;
  }
  if (CoreNLP::Resource::exists((CoreNLP **)v9, v5)) {
    v6 = (void *)[(id)CoreNLP::Resource::URL(v9) copy];
  }
  else {
    v6 = 0;
  }
  v7 = v9;
  v9 = 0;
  if (v7)
  {
    CoreNLP::Resource::~Resource(v7);
    MEMORY[0x1996F8D70]();
  }
  return v6;
}

@end