@interface SWCoreSpotlightUtilities
+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3;
+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4;
+ (id)CSSearchQueryContextForAutodonatingChats;
+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3;
+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6;
+ (id)requiredSpotlightAttributeKeysForFiles;
+ (id)requiredSpotlightAttributeKeysForLinks;
@end

@implementation SWCoreSpotlightUtilities

+ (id)requiredSpotlightAttributeKeysForFiles
{
  return (id)[MEMORY[0x1E4FA5620] requiredSpotlightAttributeKeysForFiles];
}

+ (id)requiredSpotlightAttributeKeysForLinks
{
  return (id)[MEMORY[0x1E4FA5620] requiredSpotlightAttributeKeysForLinks];
}

+ (id)fetchCSSearchableItemForUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 withRequiredAttributes:(id)a5 error:(id *)a6
{
  uint64_t v7 = a4;
  v9 = (void *)MEMORY[0x1E4FA5620];
  id v10 = a5;
  id v11 = a3;
  v12 = objc_msgSend(v9, "fetchCSSearchableItemForUniqueIdentifier:forContentType:withRequiredAttributes:error:", v11, +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v7), v10, a6);

  return v12;
}

+ (id)CSSearchQueryContextForAutodonatingChats
{
  return (id)[MEMORY[0x1E4FA5620] CSSearchQueryContextForAutodonatingChats];
}

+ (id)CSQueryStringForAutodonatingChatsWithDecay:(BOOL)a3
{
  return (id)[MEMORY[0x1E4FA5620] CSQueryStringForAutodonatingChatsWithDecay:a3];
}

+ (id)CSSearchQueryContextForSLHighlightsForContentType:(unsigned __int8)a3
{
  v3 = (void *)MEMORY[0x1E4FA5620];
  uint64_t v4 = +[SWHighlight highlightContentTypeForType:a3];

  return (id)[v3 CSSearchQueryContextForSLHighlightsForContentType:v4];
}

+ (id)CSQueryStringForSLHighlightsForContentType:(unsigned __int8)a3 forChatIdentifiers:(id)a4
{
  uint64_t v4 = a3;
  v5 = (void *)MEMORY[0x1E4FA5620];
  id v6 = a4;
  uint64_t v7 = objc_msgSend(v5, "CSQueryStringForSLHighlightsForContentType:forChatIdentifiers:", +[SWHighlight highlightContentTypeForType:](SWHighlight, "highlightContentTypeForType:", v4), v6);

  return v7;
}

@end