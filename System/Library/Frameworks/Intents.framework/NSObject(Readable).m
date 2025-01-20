@interface NSObject(Readable)
- (id)_intents_displayImageForLanguage:()Readable;
- (id)_intents_localizedCopyForLanguage:()Readable;
- (id)_intents_localizedCopyWithLocalizer:()Readable;
- (id)_intents_readableSubtitleForLanguage:()Readable withMetadata:;
- (id)_intents_readableTitleForLanguage:()Readable withMetadata:;
- (id)_intents_readableTitleWithLocalizer:()Readable metadata:;
- (uint64_t)_intents_displayImageWithLocalizer:()Readable;
- (uint64_t)_intents_readableSubtitleForLanguage:()Readable;
- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable;
- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable metadata:;
- (uint64_t)_intents_readableTitleForLanguage:()Readable;
- (uint64_t)_intents_readableTitleWithLocalizer:()Readable;
@end

@implementation NSObject(Readable)

- (id)_intents_localizedCopyForLanguage:()Readable
{
  v2 = +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:");
  v3 = objc_msgSend(a1, "_intents_localizedCopyWithLocalizer:", v2);

  return v3;
}

- (id)_intents_displayImageForLanguage:()Readable
{
  v2 = +[INStringLocalizer localizerForLanguage:](INStringLocalizer, "localizerForLanguage:");
  v3 = objc_msgSend(a1, "_intents_displayImageWithLocalizer:", v2);

  return v3;
}

- (id)_intents_readableSubtitleForLanguage:()Readable withMetadata:
{
  id v6 = a4;
  v7 = +[INStringLocalizer localizerForLanguage:a3];
  v8 = objc_msgSend(a1, "_intents_readableSubtitleWithLocalizer:metadata:", v7, v6);

  return v8;
}

- (uint64_t)_intents_readableSubtitleForLanguage:()Readable
{
  return objc_msgSend(a1, "_intents_readableSubtitleForLanguage:withMetadata:", a3, 0);
}

- (id)_intents_readableTitleForLanguage:()Readable withMetadata:
{
  id v6 = a4;
  v7 = +[INStringLocalizer localizerForLanguage:a3];
  v8 = objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:", v7, v6);

  return v8;
}

- (uint64_t)_intents_readableTitleForLanguage:()Readable
{
  return objc_msgSend(a1, "_intents_readableTitleForLanguage:withMetadata:", a3, 0);
}

- (id)_intents_localizedCopyWithLocalizer:()Readable
{
  if ([a1 conformsToProtocol:&unk_1EDBB2048]) {
    id v2 = (id)[a1 copy];
  }
  else {
    id v2 = a1;
  }

  return v2;
}

- (uint64_t)_intents_displayImageWithLocalizer:()Readable
{
  return 0;
}

- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable metadata:
{
  return 0;
}

- (uint64_t)_intents_readableSubtitleWithLocalizer:()Readable
{
  return objc_msgSend(a1, "_intents_readableSubtitleWithLocalizer:metadata:", a3, 0);
}

- (id)_intents_readableTitleWithLocalizer:()Readable metadata:
{
  id v4 = a3;
  if (objc_opt_respondsToSelector())
  {
    v5 = [v4 locale];
    id v6 = [a1 performSelector:sel_descriptionWithLocale_ withObject:v5];
  }
  else
  {
    id v6 = [a1 description];
  }

  return v6;
}

- (uint64_t)_intents_readableTitleWithLocalizer:()Readable
{
  return objc_msgSend(a1, "_intents_readableTitleWithLocalizer:metadata:", a3, 0);
}

@end