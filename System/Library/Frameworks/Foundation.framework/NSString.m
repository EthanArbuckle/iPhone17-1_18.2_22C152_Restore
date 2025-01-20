@interface NSString
+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded;
+ (BOOL)supportsSecureCoding;
+ (NSArray)readableTypeIdentifiersForItemProvider;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (NSString)allocWithZone:(_NSZone *)a3;
+ (NSString)localizedNameOfStringEncoding:(NSStringEncoding)encoding;
+ (NSString)localizedStringWithFormat:(NSString *)format;
+ (NSString)localizedStringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
+ (NSString)pathWithComponents:(NSArray *)components;
+ (NSString)string;
+ (NSString)stringWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5;
+ (NSString)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc;
+ (NSString)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length;
+ (NSString)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error;
+ (NSString)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
+ (NSString)stringWithFormat:(NSString *)format;
+ (NSString)stringWithFormat:(id)a3 locale:(id)a4;
+ (NSString)stringWithString:(NSString *)string;
+ (NSString)stringWithUTF8String:(const char *)nullTerminatedCString;
+ (NSString)stringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
+ (NSStringEncoding)defaultCStringEncoding;
+ (NSStringEncoding)stringEncodingForData:(NSData *)data encodingOptions:(NSDictionary *)opts convertedString:(NSString *)string usedLossyConversion:(BOOL *)usedLossyConversion;
+ (const)availableStringEncodings;
+ (id)_newStringFromUTF16InternalData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)_newZStringWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4;
+ (id)_newZStringWithString:(id)a3;
+ (id)_newZStringWithUTF8String:(const char *)a3;
+ (id)_stringWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
+ (id)_web_stringRepresentationForBytes:(int64_t)a3;
+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5;
+ (id)stringWithCString:(const char *)bytes;
+ (id)stringWithCString:(const char *)bytes length:(NSUInteger)length;
+ (id)stringWithContentsOfFile:(NSString *)path;
+ (id)stringWithContentsOfURL:(NSURL *)url;
+ (void)initialize;
- ($2F068FC02377E22BA03580A8162C781E)decimalValue;
- (BOOL)BOOLValue;
- (BOOL)__swiftFillFileSystemRepresentationWithPointer:(char *)a3 maxLength:(int64_t)a4;
- (BOOL)_allowsDirectEncoding;
- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5;
- (BOOL)_isCString;
- (BOOL)_web_domainMatches:(id)a3;
- (BOOL)_web_hasCaseInsensitivePrefix:(id)a3;
- (BOOL)_web_hasCountryCodeTLD;
- (BOOL)_web_isCaseInsensitiveEqualToString:(id)a3;
- (BOOL)_web_isFileURL;
- (BOOL)_web_isJavaScriptURL;
- (BOOL)_web_looksLikeAbsoluteURL;
- (BOOL)_web_looksLikeIPAddress;
- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding;
- (BOOL)containsString:(NSString *)str;
- (BOOL)getBytes:(char *)a3 maxLength:(unint64_t)a4 filledLength:(unint64_t *)a5 encoding:(unint64_t)a6 allowLossyConversion:(BOOL)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9;
- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover;
- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding;
- (BOOL)getExternalRepresentation:(id *)a3 extendedAttributes:(id *)a4 forWritingToURLOrPath:(id)a5 usingEncoding:(unint64_t)a6 error:(id *)a7;
- (BOOL)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max;
- (BOOL)hasPrefix:(NSString *)str;
- (BOOL)hasSuffix:(NSString *)str;
- (BOOL)isAbsolutePath;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToString:(NSString *)aString;
- (BOOL)isNSString__;
- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str;
- (BOOL)localizedHasPrefix:(id)a3;
- (BOOL)localizedHasSuffix:(id)a3;
- (BOOL)localizedStandardContainsString:(NSString *)str;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile;
- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically;
- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error;
- (Class)classForCoder;
- (NSArray)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator;
- (NSArray)componentsSeparatedByString:(NSString *)separator;
- (NSArray)linguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges;
- (NSArray)pathComponents;
- (NSArray)stringsByAppendingPaths:(NSArray *)paths;
- (NSArray)writableTypeIdentifiersForItemProvider;
- (NSAttributedString)__baseAttributedString;
- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string;
- (NSComparisonResult)compare:(NSString *)string;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare;
- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(id)locale;
- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string;
- (NSComparisonResult)localizedCompare:(NSString *)string;
- (NSComparisonResult)localizedStandardCompare:(NSString *)string;
- (NSData)dataUsingEncoding:(NSStringEncoding)encoding;
- (NSData)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy;
- (NSDictionary)propertyListFromStringsFileFormat;
- (NSRange)lineRangeForRange:(NSRange)range;
- (NSRange)localizedStandardRangeOfString:(NSString *)str;
- (NSRange)paragraphRangeForRange:(NSRange)range;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index;
- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range;
- (NSRange)rangeOfString:(NSString *)searchString;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch;
- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale;
- (NSString)capitalizedString;
- (NSString)capitalizedStringWithLocale:(NSLocale *)locale;
- (NSString)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask;
- (NSString)decomposedStringWithCanonicalMapping;
- (NSString)decomposedStringWithCompatibilityMapping;
- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding deallocator:(void *)deallocator;
- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer;
- (NSString)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding;
- (NSString)initWithCharacters:(const unichar *)characters length:(NSUInteger)length;
- (NSString)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;
- (NSString)initWithCharactersNoCopy:(unichar *)chars length:(NSUInteger)len deallocator:(void *)deallocator;
- (NSString)initWithCoder:(NSCoder *)coder;
- (NSString)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error;
- (NSString)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
- (NSString)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error;
- (NSString)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error;
- (NSString)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding;
- (NSString)initWithData:(id)a3 usedEncoding:(unint64_t *)a4;
- (NSString)initWithFormat:(NSString *)format;
- (NSString)initWithFormat:(NSString *)format arguments:(va_list)argList;
- (NSString)initWithFormat:(NSString *)format locale:(id)locale;
- (NSString)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList;
- (NSString)initWithString:(NSString *)aString;
- (NSString)initWithUTF8String:(const char *)nullTerminatedCString;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers arguments:(va_list)argList error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale arguments:(va_list)argList error:(NSError *)error;
- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale error:(NSError *)error;
- (NSString)lastPathComponent;
- (NSString)localizedCapitalizedString;
- (NSString)localizedLowercaseString;
- (NSString)localizedUppercaseString;
- (NSString)lowercaseString;
- (NSString)lowercaseStringWithLocale:(NSLocale *)locale;
- (NSString)pathExtension;
- (NSString)precomposedStringWithCanonicalMapping;
- (NSString)precomposedStringWithCompatibilityMapping;
- (NSString)stringByAbbreviatingWithTildeInPath;
- (NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters;
- (NSString)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
- (NSString)stringByAppendingFormat:(NSString *)format;
- (NSString)stringByAppendingPathComponent:(NSString *)str;
- (NSString)stringByAppendingPathExtension:(NSString *)str;
- (NSString)stringByAppendingString:(NSString *)aString;
- (NSString)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse;
- (NSString)stringByDeletingLastPathComponent;
- (NSString)stringByDeletingPathExtension;
- (NSString)stringByExpandingTildeInPath;
- (NSString)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale;
- (NSString)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex;
- (NSString)stringByRemovingPercentEncoding;
- (NSString)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement;
- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement;
- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange;
- (NSString)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc;
- (NSString)stringByResolvingSymlinksInPath;
- (NSString)stringByStandardizingPath;
- (NSString)stringByTrimmingCharactersInSet:(NSCharacterSet *)set;
- (NSString)substringFromIndex:(NSUInteger)from;
- (NSString)substringToIndex:(NSUInteger)to;
- (NSString)substringWithRange:(NSRange)range;
- (NSString)uppercaseString;
- (NSString)uppercaseStringWithLocale:(NSLocale *)locale;
- (NSString)variantFittingPresentationWidth:(NSInteger)width;
- (NSStringEncoding)fastestEncoding;
- (NSStringEncoding)smallestEncoding;
- (NSUInteger)cStringLength;
- (NSUInteger)completePathIntoString:(NSString *)outputName caseSensitive:(BOOL)flag matchesIntoArray:(NSArray *)outputArray filterTypes:(NSArray *)filterTypes;
- (NSUInteger)hash;
- (NSUInteger)length;
- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc;
- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc;
- (_NSRange)_rangeOfRegularExpressionPattern:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6;
- (_NSRange)_web_rangeOfURLHost;
- (_NSRange)_web_rangeOfURLResourceSpecifier_nowarn;
- (_NSRange)_web_rangeOfURLScheme_nowarn;
- (_NSRange)_web_rangeOfURLUserPasswordHostPort;
- (_NSRange)significantText;
- (const)UTF8String;
- (const)_fastCStringContents:(BOOL)a3;
- (const)_fastCharacterContents;
- (const)cString;
- (const)cStringUsingEncoding:(NSStringEncoding)encoding;
- (const)lossyCString;
- (double)doubleValue;
- (float)floatValue;
- (id)__escapeString5991;
- (id)_copyFormatStringWithConfiguration:(id)a3;
- (id)_createSubstringWithRange:(_NSRange)a3;
- (id)_initWithBytesOfUnknownEncoding:(char *)a3 length:(unint64_t)a4 copy:(BOOL)a5 usedEncoding:(unint64_t *)a6;
- (id)_initWithDataOfUnknownEncoding:(id)a3;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5;
- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6;
- (id)_initWithFormat:(id)a3 options:(id)a4;
- (id)_initWithFormat:(id)a3 options:(id)a4 arguments:(char *)a5;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6;
- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6 arguments:(char *)a7;
- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4;
- (id)_stringByReplacingOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6;
- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3;
- (id)_stringByStandardizingPathUsingCache:(BOOL)a3;
- (id)_stringRepresentation;
- (id)_urlStringByInsertingPathResolveFlags:(unsigned int)a3;
- (id)_urlStringByInsertingQueryResolveFlags:(unsigned int)a3;
- (id)_urlStringByRemovingResolveFlags;
- (id)_web_HTTPStyleLanguageCode;
- (id)_web_HTTPStyleLanguageCodeWithoutRegion;
- (id)_web_URLFragment;
- (id)_web_characterSetFromContentTypeHeader_nowarn;
- (id)_web_domainFromHost;
- (id)_web_fileNameFromContentDispositionHeader_nowarn;
- (id)_web_filenameByFixingIllegalCharacters;
- (id)_web_fixedCarbonPOSIXPath;
- (id)_web_mimeTypeFromContentTypeHeader_nowarn;
- (id)_web_parseAsKeyValuePairHandleQuotes_nowarn:(BOOL)a3;
- (id)_web_parseAsKeyValuePair_nowarn;
- (id)_web_splitAtNonDateCommas_nowarn;
- (id)_web_stringByCollapsingNonPrintingCharacters;
- (id)_web_stringByExpandingTildeInPath;
- (id)_web_stringByReplacingValidPercentEscapes_nowarn;
- (id)_web_stringByTrimmingWhitespace;
- (id)_widthVariants;
- (id)copyWithZone:(_NSZone *)a3;
- (id)displayableString;
- (id)formatConfiguration;
- (id)initWithCString:(const char *)bytes;
- (id)initWithCString:(const char *)bytes length:(NSUInteger)length;
- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer;
- (id)initWithContentsOfFile:(NSString *)path;
- (id)initWithContentsOfURL:(NSURL *)url;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)propertyList;
- (id)quotedStringRepresentation;
- (id)standardizedURLPath;
- (id)stringByAddingPercentEscapes;
- (id)stringByConvertingPathToURL;
- (id)stringByConvertingURLToPath;
- (id)stringByRemovingPercentEscapes;
- (int)intValue;
- (int64_t)_web_countOfString:(id)a3;
- (uint64_t)longLongValue;
- (unichar)characterAtIndex:(NSUInteger)index;
- (unsigned)_encodingCantBeStoredInEightBitCFString;
- (unsigned)_fastestEncodingInCFStringEncoding;
- (unsigned)_pathResolveFlags;
- (unsigned)_queryResolveFlags;
- (unsigned)_smallestEncodingInCFStringEncoding;
- (unsigned)_web_extractFourCharCode;
- (void)__graphemeCount;
- (void)_flushRegularExpressionCaches;
- (void)_getBlockStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6 stopAtLineSeparators:(BOOL)a7;
- (void)encodeWithCoder:(id)a3;
- (void)enumerateLinesUsingBlock:(void *)block;
- (void)enumerateLinguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block;
- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void *)block;
- (void)getCString:(char *)bytes;
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength;
- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange;
- (void)getCharacters:(unichar *)buffer;
- (void)getCharacters:(unichar *)buffer range:(NSRange)range;
- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range;
@end

@implementation NSString

- (BOOL)getBytes:(void *)buffer maxLength:(NSUInteger)maxBufferCount usedLength:(NSUInteger *)usedBufferCount encoding:(NSStringEncoding)encoding options:(NSStringEncodingConversionOptions)options range:(NSRange)range remainingRange:(NSRangePointer)leftover
{
  char v9 = options;
  CFStringEncoding v13 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v13 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v13 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", encoding);
      }
      CFStringEncoding v13 = 1536;
    }
  }
  NSUInteger v14 = [(NSString *)self length];
  if (!v14) {
    goto LABEL_13;
  }
  if (!CFStringIsEncodingAvailable(v13))
  {
    BOOL v15 = 0;
    NSUInteger v14 = 0;
    if (!usedBufferCount) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
  NSUInteger v14 = __CFStringEncodeByteStream();
  if ((v9 & 4) == 0 || v14 >= range.length)
  {
    if (v14)
    {
LABEL_13:
      BOOL v15 = 1;
      if (!usedBufferCount) {
        goto LABEL_17;
      }
LABEL_16:
      *usedBufferCount = 0;
      goto LABEL_17;
    }
  }
  BOOL v15 = 0;
  if (usedBufferCount) {
    goto LABEL_16;
  }
LABEL_17:
  if (leftover)
  {
    leftover->location = v14 + range.location;
    leftover->length = range.length - v14;
  }
  return v15;
}

- (NSArray)componentsSeparatedByString:(NSString *)separator
{
  uint64_t v5 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", separator, 0, 0, [(NSString *)self length]);
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    NSUInteger v9 = [(NSString *)self length];
    v10 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = [(NSString *)self zone];
    uint64_t v12 = 0;
    do
    {
      id v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      [(NSArray *)v10 addObject:v13];

      uint64_t v12 = v7 + v8;
      NSUInteger v14 = v9 - (v7 + v8);
      uint64_t v7 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", separator, 0, v7 + v8, v14);
      uint64_t v8 = v15;
    }
    while (v15);
    id v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    [(NSArray *)v10 addObject:v16];
  }
  else
  {
    id v16 = (id)[(NSString *)self copy];
    v10 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:v16];
  }

  return v10;
}

- (BOOL)localizedStandardContainsString:(NSString *)str
{
  NSUInteger v5 = [(NSString *)self length];
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 129, 0, v5, [MEMORY[0x1E4F1CA20] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch locale:(NSLocale *)locale
{
  NSUInteger length = rangeOfReceiverToSearch.length;
  NSUInteger location = rangeOfReceiverToSearch.location;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  result.NSUInteger location = 0;
  result.NSUInteger length = 0;
  NSUInteger v13 = [(NSString *)searchString length];
  NSUInteger v14 = [(NSString *)self length];
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      v19 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v14);
      v20 = (void *)MEMORY[0x1E4F1CA00];
      v21 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_19:
      objc_exception_throw((id)[v20 exceptionWithName:*v21 reason:v19 userInfo:0]);
    }
    if ((rangeOfString_options_range_locale__warnonce & 1) == 0)
    {
      rangeOfString_options_range_locale__warnonce = 1;
      uint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      v25.NSUInteger location = location;
      v25.NSUInteger length = length;
      id v16 = NSStringFromRange(v25);
      NSLog((NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v15,
        v16);
    }
  }
  if (!searchString)
  {
    v19 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    v20 = (void *)MEMORY[0x1E4F1CA00];
    v21 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_19;
  }
  if ((mask & 0x400) != 0)
  {
    CFIndex v18 = -[NSString _rangeOfRegularExpressionPattern:options:range:locale:](self, "_rangeOfRegularExpressionPattern:options:range:locale:", searchString, mask, location, length, locale);
  }
  else
  {
    CFIndex v17 = 0;
    CFIndex v18 = 0x7FFFFFFFFFFFFFFFLL;
    if (length && v13)
    {
      v27.NSUInteger location = location;
      v27.NSUInteger length = length;
      if (CFStringFindWithOptionsAndLocale((CFStringRef)self, (CFStringRef)searchString, v27, ~(8 * (_BYTE)mask) & 0x10 | mask, (CFLocaleRef)locale, &result))
      {
        CFIndex v18 = result.location;
        CFIndex v17 = result.length;
      }
      else
      {
        CFIndex v17 = 0;
        CFIndex v18 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }
  v26.NSUInteger length = v17;
  v26.NSUInteger location = v18;
  return v26;
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger v5 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, mask, rangeOfReceiverToSearch.location, rangeOfReceiverToSearch.length, 0);
  result.NSUInteger length = v6;
  result.NSUInteger location = v5;
  return result;
}

- (BOOL)getCString:(char *)buffer maxLength:(NSUInteger)maxBufferCount encoding:(NSStringEncoding)encoding
{
  v8[1] = *MEMORY[0x1E4F143B8];
  if (maxBufferCount > 1)
  {
    v8[0] = 0;
    BOOL v6 = -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", buffer, maxBufferCount - 1, v8, encoding, 4, 0, [(NSString *)self length], 0);
    if (v6)
    {
      buffer[v8[0]] = 0;
      LOBYTE(v6) = 1;
    }
    else
    {
      *buffer = 0;
    }
  }
  else
  {
    if (maxBufferCount == 1) {
      *buffer = 0;
    }
    LOBYTE(v6) = [(NSString *)self length] == 0;
  }
  return v6;
}

- (NSString)initWithUTF8String:(const char *)nullTerminatedCString
{
  if (!nullTerminatedCString)
  {
    uint64_t v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  if (self == (NSString *)&__placeholder || _CFExecutableLinkedOnOrAfter())
  {
    CFAllocatorRef v5 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    return (NSString *)CFStringCreateWithCString(v5, nullTerminatedCString, 0x8000100u);
  }
  else
  {
    size_t v7 = strlen(nullTerminatedCString);
    return [(NSString *)self initWithBytes:nullTerminatedCString length:v7 encoding:4];
  }
}

+ (NSString)stringWithUTF8String:(const char *)nullTerminatedCString
{
  if (!nullTerminatedCString)
  {
    CFAllocatorRef v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  v3 = (void *)[objc_allocWithZone((Class)a1) initWithBytes:nullTerminatedCString length:strlen(nullTerminatedCString) encoding:4];

  return (NSString *)v3;
}

+ (NSString)allocWithZone:(_NSZone *)a3
{
  if ((id)__NSStringClass == a1) {
    return (NSString *)&__placeholder;
  }
  else {
    return (NSString *)NSAllocateObject((Class)a1, 0, a3);
  }
}

- (NSUInteger)hash
{
  return MEMORY[0x1F40D8628](self, a2);
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (([a3 allowsKeyedCoding] & 1) == 0)
  {
    NSUInteger v9 = [(NSString *)self length];
    NSUInteger v10 = v9;
    NSUInteger v13 = v9;
    uint64_t v11 = 6 * v9;
    if (6 * v9 < 0x65) {
      uint64_t v8 = v14;
    }
    else {
      uint64_t v8 = malloc_type_malloc(6 * v9, 0x100004077774924uLL);
    }
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v8, v11, &v13, 4, 0, 0, v10, 0))
    {
      [a3 encodeBytes:v8 length:v13];
      goto LABEL_16;
    }
LABEL_19:
    uint64_t v12 = +[NSString stringWithFormat:@"couldn't encode string %@", self];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8] reason:v12 userInfo:0]);
  }
  if (object_getClass(a3) != (Class)NSKeyedArchiver)
  {
    NSUInteger v5 = [(NSString *)self length];
    NSUInteger v6 = v5;
    NSUInteger v13 = v5;
    uint64_t v7 = 6 * v5;
    if (6 * v5 < 0x65) {
      uint64_t v8 = v14;
    }
    else {
      uint64_t v8 = malloc_type_malloc(6 * v5, 0x100004077774924uLL);
    }
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v8, v7, &v13, 4, 0, 0, v6, 0))
    {
      [a3 encodeBytes:v8 length:v13 forKey:@"NS.bytes"];
LABEL_16:
      if (v8 != v14) {
        free(v8);
      }
      return;
    }
    goto LABEL_19;
  }

  [a3 _encodePropertyList:self forKey:@"NS.string"];
}

- (unsigned)_encodingCantBeStoredInEightBitCFString
{
  NSStringEncoding v2 = [(NSString *)self fastestEncoding];
  v3 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
  CFStringEncoding v4 = *MEMORY[0x1E4F1CBA8];
  if (*MEMORY[0x1E4F1CBA8] == -1)
  {
    __CFStringComputeEightBitStringEncoding();
    CFStringEncoding v4 = *v3;
  }
  return v2 != CFStringConvertEncodingToNSStringEncoding(v4);
}

- (NSStringEncoding)fastestEncoding
{
  return 10;
}

- (NSString)stringByAppendingString:(NSString *)aString
{
  if (!aString)
  {
    id v16 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v16);
  }
  if ([(NSString *)self length])
  {
    if ([(NSString *)aString length])
    {
      NSUInteger v5 = (malloc_zone_t *)[(NSString *)self zone];
      NSUInteger v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)aString);
      goto LABEL_8;
    }
    NSUInteger v14 = self;
  }
  else
  {
    NSUInteger v14 = aString;
  }
  NSUInteger v13 = [(NSString *)v14 copyWithZone:0];
LABEL_8:

  return v13;
}

- (BOOL)_allowsDirectEncoding
{
  return 1;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (const)UTF8String
{
  return (const char *)bytesInEncoding(self, 4, 0, 0, 0);
}

- (NSUInteger)lengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  NSUInteger v4 = [(NSString *)self length];
  if (CFStringConvertNSStringEncodingToEncoding(enc) == -1)
  {
    if (enc != 134217984 && enc) {
      return 0;
    }
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", enc);
    }
  }
  if (__CFStringEncodeByteStream() == v4) {
    return 0;
  }
  else {
    return 0;
  }
}

- (id)_newSubstringWithRange:(_NSRange)a3 zone:(_NSZone *)a4
{
  CFIndex length = a3.length;
  NSUInteger location = a3.location;
  NSUInteger v8 = [(NSString *)self length];
  if (!length) {
    return &stru_1ECA5C228;
  }
  if (location || length != v8)
  {
    uint64_t v10 = [(NSString *)self _fastCStringContents:0];
    if (v10)
    {
      CFAllocatorRef v11 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      uint64_t v12 = (const UInt8 *)&v10[location];
      NSUInteger v13 = (CFStringEncoding *)MEMORY[0x1E4F1CBA8];
      CFStringEncoding v14 = *MEMORY[0x1E4F1CBA8];
      if (*MEMORY[0x1E4F1CBA8] == -1)
      {
        __CFStringComputeEightBitStringEncoding();
        CFStringEncoding v14 = *v13;
      }
      return (id)CFStringCreateWithBytes(v11, v12, length, v14, 0);
    }
    else
    {
      uint64_t v15 = (malloc_zone_t *)a4;
      if (!a4) {
        uint64_t v15 = malloc_default_zone();
      }
      id v16 = malloc_type_zone_malloc(v15, 2 * length, 0x4A6F13AEuLL);
      -[NSString getCharacters:range:](self, "getCharacters:range:", v16, location, length);
      CFIndex v17 = +[NSString allocWithZone:a4];
      return [(NSString *)v17 initWithCharactersNoCopy:v16 length:length freeWhenDone:1];
    }
  }
  else
  {
    return [(NSString *)self copyWithZone:a4];
  }
}

- (const)_fastCStringContents:(BOOL)a3
{
  return 0;
}

- (NSString)capitalizedString
{
  return [(NSString *)self capitalizedStringWithLocale:0];
}

- (BOOL)isEqual:(id)a3
{
  if (self == a3)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    int v5 = _NSIsNSString();
    if (v5)
    {
      LOBYTE(v5) = [(NSString *)self isEqualToString:a3];
    }
  }
  return v5;
}

- (BOOL)isNSString__
{
  return 1;
}

- (BOOL)__swiftFillFileSystemRepresentationWithPointer:(char *)a3 maxLength:(int64_t)a4
{
  uint64_t v6 = self;
  LOBYTE(a4) = NSString.__swiftFillFileSystemRepresentation(pointer:maxLength:)(a3, a4);

  return a4 & 1;
}

- (const)_fastCharacterContents
{
  return 0;
}

- (Class)classForCoder
{
  return (Class)__NSStringClass;
}

- (NSComparisonResult)localizedCaseInsensitiveCompare:(NSString *)string
{
  NSUInteger v5 = [(NSString *)self length];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];

  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 1, 0, v5, v6);
}

- (NSComparisonResult)compare:(NSString *)string
{
  if (self == string) {
    return 0;
  }
  NSUInteger v6 = [(NSString *)self length];
  return -[NSString compare:options:range:](self, "compare:options:range:", string, 0, 0, v6);
}

- (NSString)stringByAppendingPathExtension:(NSString *)str
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (!str)
  {
    v22 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v22);
  }
  unint64_t v6 = [(NSString *)str length];
  NSUInteger v7 = [(NSString *)self length];
  uint64_t v23 = v7;
  if (v6)
  {
    NSUInteger v8 = v7;
    MEMORY[0x1F4188790](v7);
    uint64_t v10 = (_WORD *)((char *)&v23 - v9);
    if (v6 > 0x100)
    {
      CFAllocatorRef v11 = malloc_type_malloc(2 * v6, 0x1000040BDFB0063uLL);
      uint64_t v10 = v11;
    }
    else
    {
      bzero((char *)&v23 - v9, 2 * v6);
    }
    unint64_t v14 = v6 + v8 + 1;
    MEMORY[0x1F4188790](v11);
    CFIndex v17 = (unsigned __int16 *)((char *)&v23 - v16);
    if (v14 > 0x100) {
      CFIndex v17 = (unsigned __int16 *)malloc_type_malloc(2 * v15, 0x1000040BDFB0063uLL);
    }
    else {
      bzero((char *)&v23 - v16, 2 * v15);
    }
    -[NSString getCharacters:range:](self, "getCharacters:range:", v17, 0, v8, v23, v24);
    -[NSString getCharacters:range:](str, "getCharacters:range:", v10, 0, v6);
    if (_NSAppendPathExtension(v17, &v23, v6 + v8 + 1, v10, v6))
    {
      _NSTransmutePathSlashes(v17, &v23);
      unint64_t v18 = v23;
      if (v23 >= 2 && v17[v23 - 1] == 47)
      {
        while (v18 > 2)
        {
          int v19 = v17[v18-- - 2];
          if (v19 != 47) {
            goto LABEL_20;
          }
        }
        unint64_t v18 = 1;
      }
LABEL_20:
      v21 = +[NSPathStore2 pathStoreWithCharacters:v17 length:v18];
    }
    else
    {
      v20 = _NSMethodExceptionProem((objc_class *)self, a2);
      NSLog((NSString *)@"%@: cannot append extension '%@' to path '%@'", v20, str, self);
      v21 = 0;
    }
    if (v6 >= 0x101) {
      free(v10);
    }
    if (v14 >= 0x101) {
      free(v17);
    }
    return v21;
  }
  else
  {
    uint64_t v12 = (void *)[(NSString *)self copy];
    return (NSString *)v12;
  }
}

- (BOOL)getFileSystemRepresentation:(char *)cname maxLength:(NSUInteger)max
{
  return _NSGetFileSystemRepresentation(cname, max, self);
}

- (NSString)substringWithRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v7 = [(NSString *)self length];
  if (v7 < length || location > v7 - length)
  {
    uint64_t v10 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      location,
                      length,
                      v7),
                    0);
    objc_exception_throw(v10);
  }
  id v8 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", location, length, [(NSString *)self zone]);

  return (NSString *)v8;
}

- (id)_stringByResolvingSymlinksInPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((int64_t)[(NSString *)self length] > 1023) {
    NSUInteger v5 = 1024;
  }
  else {
    NSUInteger v5 = [(NSString *)self length];
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSResolveSymlinksInPathUsingCache(v8, &v7, v3);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:v8 length:v7];
}

- (id)_stringByStandardizingPathUsingCache:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((int64_t)[(NSString *)self length] > 1023) {
    NSUInteger v5 = 1024;
  }
  else {
    NSUInteger v5 = [(NSString *)self length];
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v5);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSStandardizePathUsingCache(v8, &v7, v3);
  return +[NSPathStore2 pathStoreWithCharacters:v8 length:v7];
}

- (NSString)stringByAppendingPathComponent:(NSString *)str
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  unint64_t v6 = [(NSString *)str length];
  unint64_t v7 = MEMORY[0x1F4188790](v6);
  uint64_t v10 = (char *)&v26 - v9;
  if (v7 > 0x100) {
    uint64_t v10 = (char *)malloc_type_malloc(2 * v8, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)&v26 - v9, 2 * v8);
  }
  -[NSString getCharacters:range:](str, "getCharacters:range:", v10, 0, v6);
  NSUInteger v11 = [(NSString *)self length];
  uint64_t v27 = v11;
  unint64_t v12 = v6 + v11 + 1;
  MEMORY[0x1F4188790](v11);
  uint64_t v15 = (unsigned __int16 *)((char *)&v26 - v14);
  if (v12 > 0x100) {
    uint64_t v15 = (unsigned __int16 *)malloc_type_malloc(2 * v13, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)&v26 - v14, 2 * v13);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v15, 0, v11);
  if ((_NSAppendPathComponent(v15, &v27, v12, v10, v6) & 1) == 0)
  {
    int v19 = _NSMethodExceptionProem((objc_class *)self, a2);
    NSLog((NSString *)@"%@: cannot append path '%@' to path '%@'", v19, str, self);
    return 0;
  }
  _NSTransmutePathSlashes(v15, &v27);
  uint64_t v16 = v27;
  if (v27 < 2) {
    goto LABEL_16;
  }
  if (v15[v27 - 1] == 47)
  {
    do
    {
      if ((unint64_t)v16 <= 2)
      {
        uint64_t v18 = 0;
        uint64_t v16 = 1;
        goto LABEL_23;
      }
      int v17 = v15[v16-- - 2];
    }
    while (v17 == 47);
    if (v16 < 2) {
      goto LABEL_16;
    }
  }
  if (*v15 == 92) {
    uint64_t v18 = 2 * (v15[1] == 92);
  }
  else {
LABEL_16:
  }
    uint64_t v18 = 0;
  if (v18 >= v16) {
    goto LABEL_18;
  }
LABEL_23:
  if (!v15[v18])
  {
LABEL_27:
    v22 = _NSOSLog();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      NSUInteger v24 = [(NSString *)str length];
      NSUInteger v25 = [(NSString *)self length];
      *(_DWORD *)buf = 138478595;
      v29 = str;
      __int16 v30 = 2048;
      NSUInteger v31 = v24;
      __int16 v32 = 2113;
      v33 = self;
      __int16 v34 = 2048;
      NSUInteger v35 = v25;
      _os_log_fault_impl(&dword_181795000, v22, OS_LOG_TYPE_FAULT, "Appending path component %{private}@ (length: %lu) to string %{private}@ (length: %lu) resulted in an embedded NUL character", buf, 0x2Au);
    }
    return 0;
  }
  while (v16 - 1 != v18)
  {
    if (!v15[++v18])
    {
      if (v18 >= v16) {
        break;
      }
      goto LABEL_27;
    }
  }
LABEL_18:
  v20 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", v15);
  if (v12 >= 0x101) {
    free(v15);
  }
  if (v6 >= 0x101) {
    free(v10);
  }
  return v20;
}

- (NSString)lastPathComponent
{
  v15[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  v15[0] = v3;
  unint64_t v4 = MEMORY[0x1F4188790](v3);
  unint64_t v7 = (_WORD *)((char *)v15 - v6);
  if (v4 > 0x100) {
    unint64_t v7 = malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v15 - v6, 2 * v5);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0, v3, v15[0]);
  _NSTransmutePathSlashes(v7, v15);
  uint64_t v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v7[v15[0] - 1] != 47)
    {
LABEL_10:
      uint64_t v11 = v8;
      do
      {
        uint64_t v10 = v11 - 1;
        if (v11 == 1) {
          break;
        }
        int v12 = (unsigned __int16)v7[v11-- - 2];
      }
      while (v12 != 47);
      goto LABEL_15;
    }
    do
    {
      if ((unint64_t)v8 <= 2)
      {
        uint64_t v10 = 0;
        uint64_t v8 = 1;
        v15[0] = 1;
        goto LABEL_15;
      }
      int v9 = (unsigned __int16)v7[v8-- - 2];
    }
    while (v9 == 47);
    v15[0] = v8;
    if (v8 >= 2) {
      goto LABEL_10;
    }
  }
  uint64_t v10 = 0;
LABEL_15:
  uint64_t v13 = +[NSPathStore2 pathStoreWithCharacters:length:](NSPathStore2, "pathStoreWithCharacters:length:", &v7[v10], v8 - v10, v15[0]);
  if (v3 >= 0x101) {
    free(v7);
  }
  return v13;
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask
{
  if (self == string) {
    return 0;
  }
  NSUInteger v8 = [(NSString *)self length];
  return -[NSString compare:options:range:](self, "compare:options:range:", string, mask, 0, v8);
}

- (NSComparisonResult)caseInsensitiveCompare:(NSString *)string
{
  NSUInteger v5 = [(NSString *)self length];

  return -[NSString compare:options:range:](self, "compare:options:range:", string, 1, 0, v5);
}

- (BOOL)isEqualToString:(NSString *)aString
{
  return self == aString
      || -[NSString compare:options:range:](self, "compare:options:range:", aString, 2, 0, [(NSString *)self length]) == NSOrderedSame;
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare locale:(id)locale
{
  if (self == string) {
    return 0;
  }
  if (!string) {
    return 1;
  }
  CFIndex length = rangeOfReceiverToCompare.length;
  CFIndex location = rangeOfReceiverToCompare.location;
  if (locale)
  {
    char isKindOfClass = objc_opt_isKindOfClass();
    if (isKindOfClass) {
      CFLocaleRef v13 = (const __CFLocale *)locale;
    }
    else {
      CFLocaleRef v13 = 0;
    }
    if ((isKindOfClass & 1) == 0) {
      mask |= 0x20uLL;
    }
  }
  else
  {
    CFLocaleRef v13 = 0;
  }
  v15.CFIndex location = location;
  v15.CFIndex length = length;

  return CFStringCompareWithOptionsAndLocale((CFStringRef)self, (CFStringRef)string, v15, ~(8 * (_BYTE)mask) & 0x10 | mask, v13);
}

- (NSComparisonResult)compare:(NSString *)string options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToCompare
{
  if (self == string) {
    return 0;
  }
  else {
    return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:");
  }
}

- (NSString)pathExtension
{
  v13[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  v13[0] = v3;
  unint64_t v4 = MEMORY[0x1F4188790](v3);
  unint64_t v7 = (_WORD *)((char *)v13 - v6);
  if (v4 > 0x100) {
    unint64_t v7 = malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v13 - v6, 2 * v5);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0, v3, v13[0]);
  _NSTransmutePathSlashes(v7, v13);
  unint64_t v8 = v13[0];
  if (v13[0] > 1)
  {
    if (v7[v13[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        int v9 = (unsigned __int16)v7[v8-- - 2];
        if (v9 != 47) {
          goto LABEL_10;
        }
      }
      unint64_t v8 = 1;
    }
LABEL_10:
    v13[0] = v8;
  }
  uint64_t v10 = _NSStartOfPathExtension((uint64_t)v7, v8);
  if (v10 < 1) {
    uint64_t v11 = (NSString *)&stru_1ECA5C228;
  }
  else {
    uint64_t v11 = +[NSPathStore2 pathStoreWithCharacters:&v7[v10 + 1] length:v8 + ~v10];
  }
  if (v3 >= 0x101) {
    free(v7);
  }
  return v11;
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask
{
  NSUInteger v7 = [(NSString *)self length];

  NSUInteger v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", searchSet, mask, 0, v7);
  result.CFIndex length = v9;
  result.CFIndex location = v8;
  return result;
}

- (BOOL)_getCString:(char *)a3 maxLength:(unint64_t)a4 encoding:(unsigned int)a5
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v8 = CFStringConvertEncodingToNSStringEncoding(a5);
  if (v8 == 0xFFFFFFFF
    || (v10[0] = 0,
        !-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", a3, a4, v10, v8, 0, 0, [(NSString *)self length], 0)))
  {
    BOOL result = 0;
  }
  else
  {
    a3 += v10[0];
    BOOL result = 1;
  }
  *a3 = 0;
  return result;
}

- (BOOL)getBytes:(char *)a3 maxLength:(unint64_t)a4 filledLength:(unint64_t *)a5 encoding:(unint64_t)a6 allowLossyConversion:(BOOL)a7 range:(_NSRange)a8 remainingRange:(_NSRange *)a9
{
  return -[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", a3, a4, a5, a6, a7 | 6);
}

+ (NSString)stringWithCString:(const char *)cString encoding:(NSStringEncoding)enc
{
  if (!cString)
  {
    uint64_t v6 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v6);
  }
  unint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithBytes:cString length:strlen(cString) encoding:enc];

  return (NSString *)v4;
}

- (id)_stringByReplacingOccurrencesOfRegularExpressionPattern:(id)a3 withTemplate:(id)a4 options:(unint64_t)a5 range:(_NSRange)a6
{
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  unint64_t v12 = a5 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  CFLocaleRef v13 = +[NSString stringWithFormat:@"%lx:%@", v12, a3];
  uint64_t v14 = (NSRegularExpression *)(id)[(id)qword_1EB1EDC60 objectForKey:v13];
  if (v14) {
    goto LABEL_6;
  }
  CFRange v15 = [[NSRegularExpression alloc] initWithPattern:a3 options:v12 error:0];
  if (v15)
  {
    uint64_t v14 = v15;
    [(id)qword_1EB1EDC60 setObject:v15 forKey:v13];
LABEL_6:
    uint64_t v16 = -[NSRegularExpression stringByReplacingMatchesInString:options:range:withTemplate:](v14, "stringByReplacingMatchesInString:options:range:withTemplate:", self, (a5 >> 1) & 4, location, length, a4);

    return v16;
  }
  return self;
}

+ (NSString)localizedStringWithFormat:(NSString *)format
{
  va_start(va, format);
  id v4 = objc_allocWithZone((Class)a1);
  return (NSString *)(id)objc_msgSend(v4, "initWithFormat:locale:arguments:", format, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), va);
}

- (_NSRange)_rangeOfRegularExpressionPattern:(id)a3 options:(unint64_t)a4 range:(_NSRange)a5 locale:(id)a6
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  unint64_t v11 = a4 & 1;
  if (_MergedGlobals_144 != -1) {
    dispatch_once(&_MergedGlobals_144, &__block_literal_global_69);
  }
  unint64_t v12 = +[NSString stringWithFormat:@"%lx:%@", v11, a3];
  CFLocaleRef v13 = (NSRegularExpression *)(id)[(id)qword_1EB1EDC60 objectForKey:v12];
  if (!v13)
  {
    uint64_t v14 = [[NSRegularExpression alloc] initWithPattern:a3 options:v11 error:0];
    if (!v14)
    {
      NSUInteger v18 = 0x7FFFFFFFFFFFFFFFLL;
      NSUInteger v19 = 0;
      goto LABEL_8;
    }
    CFLocaleRef v13 = v14;
    [(id)qword_1EB1EDC60 setObject:v14 forKey:v12];
  }
  uint64_t v15 = -[NSRegularExpression rangeOfFirstMatchInString:options:range:](v13, "rangeOfFirstMatchInString:options:range:", self, (a4 >> 1) & 4, location, length);
  NSUInteger v17 = v16;

  NSUInteger v18 = v15;
  NSUInteger v19 = v17;
LABEL_8:
  result.NSUInteger length = v19;
  result.NSUInteger location = v18;
  return result;
}

- (NSString)stringByAppendingFormat:(NSString *)format
{
  va_start(va, format);
  id v4 = [(NSString *)&__placeholder initWithFormat:format arguments:va];
  uint64_t v5 = (malloc_zone_t *)[(NSString *)self zone];
  CFLocaleRef v13 = _NSNewStringByAppendingStrings(v5, v6, v7, v8, v9, v10, v11, v12, (size_t)self, (uint64_t)v4);

  return v13;
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale
{
  va_start(va, locale);
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, locale, va, va);
}

- (NSString)initWithFormat:(NSString *)format
{
  va_start(va, format);
  return -[NSString initWithFormat:locale:arguments:](self, "initWithFormat:locale:arguments:", format, 0, va, va);
}

+ (NSString)stringWithFormat:(NSString *)format
{
  va_start(va, format);
  NSUInteger v3 = (NSString *)[objc_allocWithZone((Class)a1) initWithFormat:format locale:0 arguments:va];
  id v4 = v3;
  return v3;
}

- (NSAttributedString)__baseAttributedString
{
  return 0;
}

- (NSString)initWithFormat:(NSString *)format arguments:(va_list)argList
{
  return [(NSString *)self initWithFormat:format locale:0 arguments:argList];
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet options:(NSStringCompareOptions)mask range:(NSRange)rangeOfReceiverToSearch
{
  NSUInteger length = rangeOfReceiverToSearch.length;
  NSUInteger location = rangeOfReceiverToSearch.location;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  result.NSUInteger location = 0;
  result.NSUInteger length = 0;
  NSUInteger v11 = [(NSString *)self length];
  if (v11 < length || location > v11 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      NSUInteger v18 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
              _NSMethodExceptionProem((objc_class *)self, a2),
              location,
              length,
              v11);
      NSUInteger v19 = (void *)MEMORY[0x1E4F1CA00];
      v20 = (void *)MEMORY[0x1E4F1C4A8];
LABEL_16:
      objc_exception_throw((id)[v19 exceptionWithName:*v20 reason:v18 userInfo:0]);
    }
    if ((rangeOfCharacterFromSet_options_range__warnonce & 1) == 0)
    {
      rangeOfCharacterFromSet_options_range__warnonce = 1;
      uint64_t v12 = _NSMethodExceptionProem((objc_class *)self, a2);
      v23.NSUInteger location = location;
      v23.NSUInteger length = length;
      CFLocaleRef v13 = NSStringFromRange(v23);
      NSLog((NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v12,
        v13);
    }
  }
  if (!searchSet)
  {
    NSUInteger v18 = +[NSString stringWithFormat:@"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)];
    NSUInteger v19 = (void *)MEMORY[0x1E4F1CA00];
    v20 = (void *)MEMORY[0x1E4F1C3C8];
    goto LABEL_16;
  }
  v25.NSUInteger location = location;
  v25.NSUInteger length = length;
  int CharacterFromSet = CFStringFindCharacterFromSet((CFStringRef)self, (CFCharacterSetRef)searchSet, v25, mask, &result);
  BOOL v15 = CharacterFromSet == 0;
  if (CharacterFromSet) {
    CFIndex v16 = result.location;
  }
  else {
    CFIndex v16 = 0x7FFFFFFFFFFFFFFFLL;
  }
  if (v15) {
    CFIndex v17 = 0;
  }
  else {
    CFIndex v17 = result.length;
  }
  v24.NSUInteger length = v17;
  v24.NSUInteger location = v16;
  return v24;
}

- (id)_stringRepresentation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  if (!v3) {
    return @"\"\"";
  }
  uint64_t v16 = 0;
  uint64_t v20 = 0;
  memset(v19, 0, sizeof(v19));
  CFIndex v17 = self;
  long long v18 = v3;
  if (v3 >= 0x20) {
    uint64_t v4 = 32;
  }
  else {
    uint64_t v4 = v3;
  }
  unint64_t v15 = v4;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), v19, 0, v4);
  int v5 = LOWORD(v19[0]);
  LOWORD(v20) = v19[0];
  uint64_t v16 = 1;
  unint64_t v6 = 1;
  while (v6 - 1 < v15)
  {
    unsigned int v7 = (v5 & 0xFFDF) - 65;
    unsigned int v8 = v5 - 48;
    BOOL v10 = v7 < 0x1A || v8 < 0xA;
    if (v6 >= v15)
    {
      unint64_t v12 = *((void *)&v18 + 1) + v15;
      if ((unint64_t)v18 <= *((void *)&v18 + 1) + v15)
      {
        unint64_t v6 = v15 + 1;
        uint64_t v16 = v15 + 1;
        int v5 = 0xFFFF;
        goto LABEL_22;
      }
      if ((unint64_t)v18 - (*((void *)&v18 + 1) + v15) >= 0x20) {
        uint64_t v13 = 32;
      }
      else {
        uint64_t v13 = v18 - (*((void *)&v18 + 1) + v15);
      }
      *((void *)&v18 + 1) += v15;
      unint64_t v15 = v13;
      objc_msgSend(v17, sel_getUid("getCharacters:range:"), v19, v12, v13);
      int v5 = LOWORD(v19[0]);
      LOWORD(v20) = v19[0];
      uint64_t v16 = 1;
      unint64_t v6 = 1;
      if (!v10) {
        return [(NSString *)self quotedStringRepresentation];
      }
    }
    else
    {
      NSUInteger v11 = (char *)&v15 + 2 * v6++;
      uint64_t v16 = v6;
      int v5 = *((unsigned __int16 *)v11 + 20);
LABEL_22:
      LOWORD(v20) = v5;
      if (!v10) {
        return [(NSString *)self quotedStringRepresentation];
      }
    }
  }
  return [(NSString *)self copyWithZone:0];
}

- (NSString)stringByTrimmingCharactersInSet:(NSCharacterSet *)set
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (!set)
  {
    v28 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v28);
  }
  long long v33 = 0u;
  memset(v32, 0, sizeof(v32));
  long long v29 = 0u;
  NSUInteger v5 = [(NSString *)self length];
  NSUInteger v6 = v5;
  unint64_t v31 = v5;
  *(void *)&v32[0] = 0;
  __int16 v30 = self;
  if (!v5)
  {
    long long v29 = xmmword_182106C90;
    WORD4(v33) = -1;
    uint64_t v12 = 1;
    goto LABEL_21;
  }
  if (v5 >= 0x20) {
    uint64_t v7 = 32;
  }
  else {
    uint64_t v7 = v5;
  }
  *(void *)&long long v29 = v7;
  objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v32 + 8, 0, v7);
  unsigned __int16 v8 = WORD4(v32[0]);
  *((void *)&v29 + 1) = 1;
  WORD4(v33) = WORD4(v32[0]);
  while (1)
  {
    BOOL v9 = [(NSCharacterSet *)set characterIsMember:v8];
    uint64_t v10 = *((void *)&v29 + 1);
    if (!v9) {
      break;
    }
    unint64_t v11 = v29;
    if (*((void *)&v29 + 1) >= (unint64_t)v29)
    {
      uint64_t v13 = *(void *)&v32[0] + v29;
      if (v31 > *(void *)&v32[0] + (void)v29)
      {
        if (v31 - (*(void *)&v32[0] + (void)v29) >= 0x20) {
          uint64_t v14 = 32;
        }
        else {
          uint64_t v14 = v31 - (*(void *)&v32[0] + v29);
        }
        *(void *)&v32[0] += v29;
        *(void *)&long long v29 = v14;
        objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v13, v14);
        unsigned __int16 v8 = WORD4(v32[0]);
        WORD4(v33) = WORD4(v32[0]);
        *((void *)&v29 + 1) = 1;
        unint64_t v11 = v29;
        uint64_t v12 = 1;
        goto LABEL_17;
      }
      uint64_t v12 = v29 + 1;
      *((void *)&v29 + 1) = v29 + 1;
      unsigned __int16 v8 = -1;
    }
    else
    {
      uint64_t v12 = ++*((void *)&v29 + 1);
      unsigned __int16 v8 = *((_WORD *)v32 + v10 + 4);
    }
    WORD4(v33) = v8;
LABEL_17:
    if (v12 - 1 >= v11) {
      goto LABEL_21;
    }
  }
  uint64_t v12 = *((void *)&v29 + 1);
LABEL_21:
  uint64_t v15 = *(void *)&v32[0];
  unint64_t v16 = v12 + *(void *)&v32[0] - 1;
  if (v16 == v6) {
    return (NSString *)&stru_1ECA5C228;
  }
  unint64_t v18 = v6 - 1;
  if (v16 >= v6 - 1)
  {
    uint64_t v21 = 1;
  }
  else
  {
    if (*(void *)&v32[0] > v18 || (void)v29 + *(void *)&v32[0] <= v18)
    {
      if (v18 > 0xF)
      {
        unint64_t v20 = v31;
        if (v31 - 16 >= v18)
        {
          unint64_t v19 = v6 - 17;
        }
        else if (v31 >= 0x20)
        {
          unint64_t v19 = v31 - 32;
        }
        else
        {
          unint64_t v19 = 0;
        }
        *(void *)&v32[0] = v19;
      }
      else
      {
        unint64_t v19 = 0;
        *(void *)&v32[0] = 0;
        unint64_t v20 = v31;
      }
      unint64_t v22 = v20 - v19;
      if (v22 >= 0x20) {
        uint64_t v23 = 32;
      }
      else {
        uint64_t v23 = v22;
      }
      *(void *)&long long v29 = v23;
      objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, v19, v23);
      WORD4(v33) = WORD4(v32[0]);
      uint64_t v15 = *(void *)&v32[0];
    }
    uint64_t v24 = v18 - v15;
    *((void *)&v29 + 1) = v24 + 1;
    WORD4(v33) = *((_WORD *)v32 + v24 + 4);
    if (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"))
    {
      do
      {
        uint64_t v25 = *((void *)&v29 + 1);
        if (*((void *)&v29 + 1) - 1 + *(void *)&v32[0] < v16) {
          break;
        }
        if (*((void *)&v29 + 1) < 2uLL)
        {
          if (*(void *)&v32[0])
          {
            uint64_t v27 = *(void *)&v32[0] >= 0x20uLL ? 32 : *(void *)&v32[0];
            *(void *)&long long v29 = v27;
            *((void *)&v29 + 1) = v27;
            *(void *)&v32[0] -= v27;
            objc_msgSend(v30, sel_getUid("getCharacters:range:"), (char *)v32 + 8, *(void *)&v32[0], v27);
            __int16 v26 = *((_WORD *)v32 + *((void *)&v29 + 1) + 3);
          }
          else
          {
            *((void *)&v29 + 1) = 0;
            __int16 v26 = -1;
          }
        }
        else
        {
          --*((void *)&v29 + 1);
          __int16 v26 = *((_WORD *)v32 + v25 + 2);
        }
        WORD4(v33) = v26;
      }
      while (-[NSCharacterSet characterIsMember:](set, "characterIsMember:"));
    }
    uint64_t v21 = *(void *)&v32[0] - v16 + *((void *)&v29 + 1);
  }
  return -[NSString substringWithRange:](self, "substringWithRange:", v16, v21);
}

- (id)_createSubstringWithRange:(_NSRange)a3
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  if (!_createSubstringWithRange__baseImp)
  {
    uint64_t v7 = (objc_class *)objc_opt_class();
    _createSubstringWithRange__baseImp = (uint64_t)class_getMethodImplementation(v7, sel_substringWithRange_);
  }
  unsigned __int16 v8 = (objc_class *)objc_opt_class();
  if ((IMP)_createSubstringWithRange__baseImp == class_getMethodImplementation(v8, sel_substringWithRange_))
  {
    NSUInteger v11 = [(NSString *)self length];
    if (v11 < length || location > v11 - length)
    {
      uint64_t v13 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                        _NSMethodExceptionProem((objc_class *)self, a2),
                        location,
                        length,
                        v11),
                      0);
      objc_exception_throw(v13);
    }
    uint64_t v12 = [(NSString *)self zone];
    return -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", location, length, v12);
  }
  else
  {
    BOOL v9 = -[NSString substringWithRange:](self, "substringWithRange:", location, length);
    return v9;
  }
}

- (id)quotedStringRepresentation
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  if (!v3) {
    return @"\"\"";
  }
  unint64_t v4 = v3;
  if (6 * v3 + 3 <= 0x186A0) {
    unint64_t v5 = 6 * v3 + 3;
  }
  else {
    unint64_t v5 = v3 + 9;
  }
  id result = (id)MEMORY[0x1853044A0](0, v5, 1274984169, 0);
  if (result)
  {
    uint64_t v7 = result;
    *(unsigned char *)id result = 34;
    uint64_t v26 = 0;
    memset(v25, 0, sizeof(v25));
    uint64_t v23 = self;
    long long v24 = v4;
    if (v4 >= 0x20) {
      uint64_t v8 = 32;
    }
    else {
      uint64_t v8 = v4;
    }
    unint64_t v21 = v8;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), v25, 0, v8);
    unsigned __int16 v9 = v25[0];
    LOWORD(v26) = v25[0];
    unint64_t v22 = 1;
    uint64_t v10 = 1;
    unint64_t v11 = 1;
    while (1)
    {
      if (v11 > v5 - 8)
      {
        unint64_t v12 = 6 * (v4 + 1 - v10 - *((void *)&v24 + 1)) + 2;
        if (v5 < v12) {
          unint64_t v12 = v5;
        }
        v5 += v12;
        id result = (id)MEMORY[0x185306D90](0, v7, v5, 2391504207, 0, 0);
        if (!result) {
          return result;
        }
        uint64_t v7 = result;
        unsigned __int16 v9 = v26;
      }
      switch(v9)
      {
        case 7u:
          LOBYTE(v9) = 97;
          goto LABEL_27;
        case 8u:
          LOBYTE(v9) = 98;
          goto LABEL_27;
        case 9u:
          LOBYTE(v9) = 116;
          goto LABEL_27;
        case 0xAu:
          LOBYTE(v9) = 110;
          goto LABEL_27;
        case 0xBu:
          LOBYTE(v9) = 118;
          goto LABEL_27;
        case 0xCu:
          LOBYTE(v9) = 102;
          goto LABEL_27;
        default:
          if (v9 == 92)
          {
            LOBYTE(v9) = 92;
            goto LABEL_27;
          }
          if (v9 == 34)
          {
            LOBYTE(v9) = 34;
LABEL_27:
            unint64_t v13 = v11 + 1;
            v7[v11] = 92;
            uint64_t v14 = 2;
LABEL_28:
            v11 += v14;
            v7[v13] = v9;
            goto LABEL_29;
          }
          if (v9 >= 0x80u)
          {
            unint64_t v19 = &v7[v11];
            *(_WORD *)unint64_t v19 = 21852;
            v19[2] = a0123456789abcd[(unint64_t)v9 >> 12];
            v19[3] = a0123456789abcd[((unint64_t)v9 >> 8) & 0xF];
            unint64_t v13 = v11 + 5;
            _OWORD v19[4] = a0123456789abcd[v9 >> 4];
            LOBYTE(v9) = a0123456789abcd[v9 & 0xF];
            uint64_t v14 = 6;
            goto LABEL_28;
          }
          if ((_BYTE)v9)
          {
            uint64_t v14 = 1;
            unint64_t v13 = v11;
            goto LABEL_28;
          }
LABEL_29:
          unint64_t v16 = v21;
          unint64_t v15 = v22;
          if (v22 >= v21)
          {
            unint64_t v17 = *((void *)&v24 + 1) + v21;
            if ((unint64_t)v24 > *((void *)&v24 + 1) + v21)
            {
              if ((unint64_t)v24 - (*((void *)&v24 + 1) + v21) >= 0x20) {
                uint64_t v18 = 32;
              }
              else {
                uint64_t v18 = v24 - (*((void *)&v24 + 1) + v21);
              }
              *((void *)&v24 + 1) += v21;
              unint64_t v21 = v18;
              objc_msgSend(v23, sel_getUid("getCharacters:range:"), v25, v17, v18);
              unsigned __int16 v9 = v25[0];
              LOWORD(v26) = v25[0];
              unint64_t v22 = 1;
              unint64_t v16 = v18;
              uint64_t v10 = 1;
              goto LABEL_38;
            }
            uint64_t v10 = v21 + 1;
            unint64_t v22 = v21 + 1;
            unsigned __int16 v9 = -1;
          }
          else
          {
            uint64_t v10 = ++v22;
            unsigned __int16 v9 = *((_WORD *)v25 + v15);
          }
          LOWORD(v26) = v9;
LABEL_38:
          if (v10 - 1 >= v16)
          {
            *(_WORD *)&v7[v11] = 34;
            unint64_t v20 = (const char *)MEMORY[0x185306D90](0, v7, v11 + 2, 3094762909, 0, 0);
            return (id)(id)CFStringCreateWithCStringNoCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], v20, 0x600u, 0);
          }
          break;
      }
    }
  }
  return result;
}

+ (NSString)string
{
  NSStringEncoding v2 = (void *)[objc_allocWithZone((Class)a1) init];

  return (NSString *)v2;
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement options:(NSStringCompareOptions)options range:(NSRange)searchRange
{
  if (!replacement)
  {
    unint64_t v15 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v15);
  }
  NSUInteger length = searchRange.length;
  NSUInteger location = searchRange.location;
  if ((options & 0x400) != 0)
  {
    return (NSString *)-[NSString _stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:](self, "_stringByReplacingOccurrencesOfRegularExpressionPattern:withTemplate:options:range:");
  }
  else
  {
    unint64_t v12 = (NSString *)[(NSString *)self mutableCopy];
    if (-[NSString replaceOccurrencesOfString:withString:options:range:](v12, "replaceOccurrencesOfString:withString:options:range:", target, replacement, options, location, length))
    {
      unint64_t v13 = v12;
    }
    else
    {

      unint64_t v13 = self;
    }
    return v13;
  }
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[NSMutableString allocWithZone:a3];

  return [(NSString *)v4 initWithString:self];
}

- (NSString)stringByReplacingCharactersInRange:(NSRange)range withString:(NSString *)replacement
{
  if (!replacement)
  {
    unsigned __int16 v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: nil argument", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  uint64_t v7 = (void *)[(NSString *)self mutableCopy];
  objc_msgSend(v7, "replaceCharactersInRange:withString:", location, length, replacement);

  return (NSString *)v7;
}

+ (NSString)stringWithString:(NSString *)string
{
  NSUInteger v3 = (void *)[objc_allocWithZone((Class)a1) initWithString:string];

  return (NSString *)v3;
}

- (BOOL)isAbsolutePath
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if ((int64_t)[(NSString *)self length] >= 3)
  {
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, 3);
  }
  else
  {
    uint64_t v3 = [(NSString *)self length];
    -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3);
    if (v3 < 1) {
      return 0;
    }
  }
  return v6[0] == 126 || v6[0] == 47;
}

- (NSString)stringByStandardizingPath
{
  return (NSString *)[(NSString *)self _stringByStandardizingPathUsingCache:0];
}

- (unsigned)_fastestEncodingInCFStringEncoding
{
  unint64_t v2 = [(NSString *)self fastestEncoding];

  return CFStringConvertNSStringEncodingToEncoding(v2);
}

- (const)cStringUsingEncoding:(NSStringEncoding)encoding
{
  return (const char *)bytesInEncoding(self, encoding, 0, 0, 0);
}

- (NSRange)rangeOfString:(NSString *)searchString
{
  NSUInteger v5 = [(NSString *)self length];

  NSUInteger v6 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, 0, 0, v5, 0);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

+ (NSString)stringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  va_start(va, error);
  return (NSString *)(id)[objc_allocWithZone((Class)a1) initWithValidatedFormat:format validFormatSpecifiers:validFormatSpecifiers locale:0 arguments:va error:error];
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v4 = +[NSString allocWithZone:a3];

  return [(NSString *)v4 initWithString:self];
}

- (BOOL)hasSuffix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", str, 12, 0, [(NSString *)self length]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasPrefix:(NSString *)str
{
  return -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", str, 8, 0, [(NSString *)self length]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding allowLossyConversion:(BOOL)lossy
{
  v15[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v7 = [(NSString *)self length];
  v15[0] = 0;
  CFStringEncoding v8 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v8 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v8 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", encoding);
      }
      CFStringEncoding v8 = 1536;
    }
  }
  if (CFStringIsEncodingAvailable(v8))
  {
    uint64_t v9 = __CFStringEncodeByteStream();
    NSRange result = 0;
    if (v9 == v7)
    {
      id v11 = objc_allocWithZone(MEMORY[0x1E4F1CA58]);
      unint64_t v12 = objc_msgSend(v11, "initWithLength:", v15[0], v15);
      unint64_t v13 = v12;
      if (v15[0])
      {
        [v12 mutableBytes];
        if (__CFStringEncodeByteStream() != v7)
        {

          uint64_t v14 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: didn't convert all characters", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
          objc_exception_throw(v14);
        }
        objc_msgSend(v13, "setLength:", v15[0], v15);
      }
      return (NSData *)v13;
    }
  }
  else
  {
    NSLog((NSString *)@"Unknown encoding %ld", encoding);
    return 0;
  }
  return result;
}

- (id)formatConfiguration
{
  return 0;
}

- (float)floatValue
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  unint64_t v4 = 0;
  v5[0] = 0.0;
  int v2 = _NSScanDoubleFromString(self, +[NSCharacterSet whitespaceCharacterSet], v5, &v4, 0);
  float result = v5[0];
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (BOOL)BOOLValue
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = +[NSCharacterSet whitespaceCharacterSet];
  NSUInteger v4 = [(NSString *)self length];
  long long v24 = 0u;
  memset(v23, 0, sizeof(v23));
  long long v20 = 0u;
  unint64_t v21 = self;
  NSUInteger v22 = v4;
  if (v4)
  {
    if (v4 >= 0x20) {
      uint64_t v5 = 32;
    }
    else {
      uint64_t v5 = v4;
    }
    *(void *)&long long v20 = v5;
    objc_msgSend(self, sel_getUid("getCharacters:range:"), (char *)v23 + 8, 0, v5);
    __int16 v6 = WORD4(v23[0]);
  }
  else
  {
    __int16 v6 = -1;
  }
  *((void *)&v20 + 1) = 1;
  WORD4(v24) = v6;
  if ([(NSCharacterSet *)v3 characterIsMember:(void)v20])
  {
    do
    {
      long long v7 = v20;
      if (*((void *)&v20 + 1) >= (unint64_t)v20)
      {
        uint64_t v9 = *(void *)&v23[0] + v20;
        if (v22 > *(void *)&v23[0] + (void)v20)
        {
          if (v22 - (*(void *)&v23[0] + (void)v20) >= 0x20) {
            uint64_t v10 = 32;
          }
          else {
            uint64_t v10 = v22 - (*(void *)&v23[0] + v20);
          }
          *(void *)&v23[0] += v20;
          *(void *)&long long v20 = v10;
          objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v9, v10);
          WORD4(v24) = WORD4(v23[0]);
          *((void *)&v20 + 1) = 1;
          continue;
        }
        *((void *)&v20 + 1) = v20 + 1;
        __int16 v8 = -1;
      }
      else
      {
        ++*((void *)&v20 + 1);
        __int16 v8 = *((_WORD *)v23 + *((void *)&v7 + 1) + 4);
      }
      WORD4(v24) = v8;
    }
    while (-[NSCharacterSet characterIsMember:](v3, "characterIsMember:"));
  }
  int v11 = WORD4(v24);
  BOOL result = 1;
  if (WORD4(v24) <= 0x58u)
  {
    if (WORD4(v24) == 43 || WORD4(v24) == 45)
    {
      long long v13 = v20;
      if (*((void *)&v20 + 1) >= (unint64_t)v20)
      {
        uint64_t v14 = *(void *)&v23[0] + v20;
        if (v22 <= *(void *)&v23[0] + (void)v20)
        {
LABEL_45:
          int v11 = 0xFFFF;
          return (v11 - 49) < 9;
        }
        if (v22 - (*(void *)&v23[0] + (void)v20) >= 0x20) {
          uint64_t v15 = 32;
        }
        else {
          uint64_t v15 = v22 - (*(void *)&v23[0] + v20);
        }
        *(void *)&v23[0] += v20;
        *(void *)&long long v20 = v15;
        objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v14, v15);
        int v11 = WORD4(v23[0]);
        WORD4(v24) = WORD4(v23[0]);
        *((void *)&v20 + 1) = 1;
      }
      else
      {
        ++*((void *)&v20 + 1);
        int v11 = *((unsigned __int16 *)v23 + *((void *)&v13 + 1) + 4);
        WORD4(v24) = *((_WORD *)v23 + *((void *)&v13 + 1) + 4);
      }
    }
    else if (WORD4(v24) == 84)
    {
      return result;
    }
LABEL_34:
    if (v11 == 48)
    {
      unint64_t v16 = *((void *)&v20 + 1);
      do
      {
        if (v16 >= (unint64_t)v20)
        {
          uint64_t v18 = *(void *)&v23[0] + v20;
          if (v22 <= *(void *)&v23[0] + (void)v20) {
            goto LABEL_45;
          }
          if (v22 - (*(void *)&v23[0] + (void)v20) >= 0x20) {
            uint64_t v19 = 32;
          }
          else {
            uint64_t v19 = v22 - (*(void *)&v23[0] + v20);
          }
          *(void *)&v23[0] += v20;
          *(void *)&long long v20 = v19;
          objc_msgSend(v21, sel_getUid("getCharacters:range:"), (char *)v23 + 8, v18, v19);
          int v11 = WORD4(v23[0]);
          WORD4(v24) = WORD4(v23[0]);
          *((void *)&v20 + 1) = 1;
          unint64_t v16 = 1;
        }
        else
        {
          unint64_t v17 = (char *)&v20 + 2 * v16++;
          *((void *)&v20 + 1) = v16;
          int v11 = *((unsigned __int16 *)v17 + 20);
          WORD4(v24) = v11;
        }
      }
      while (v11 == 48);
    }
    return (v11 - 49) < 9;
  }
  if (WORD4(v24) != 89 && WORD4(v24) != 116 && WORD4(v24) != 121) {
    goto LABEL_34;
  }
  return result;
}

- (NSString)substringFromIndex:(NSUInteger)from
{
  NSUInteger v6 = [(NSString *)self length];
  if (v6 < from)
  {
    __int16 v8 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     from,
                     v6),
                   0);
    objc_exception_throw(v8);
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", from, v6 - from);
}

- (int)intValue
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  int v4 = 0;
  unint64_t v3 = 0;
  if (_NSScanIntFromString(self, +[NSCharacterSet whitespaceCharacterSet], &v4, &v3))return v4; {
  else
  }
    return 0;
}

- (uint64_t)longLongValue
{
  v4[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = 0;
  v4[0] = 0;
  if (_NSScanLongLongFromString(self, +[NSCharacterSet whitespaceCharacterSet], v4, &v3))return v4[0]; {
  else
  }
    return 0;
}

- (NSString)capitalizedStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringCapitalize(Mutable, (CFLocaleRef)locale);

  return (NSString *)Mutable;
}

- (NSString)decomposedStringWithCanonicalMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormD);

  return (NSString *)Mutable;
}

- (NSString)stringByAddingPercentEncodingWithAllowedCharacters:(NSCharacterSet *)allowedCharacters
{
  unint64_t v3 = (void *)_CFStringCreateByAddingPercentEncodingWithAllowedCharacters();

  return (NSString *)v3;
}

- (NSArray)pathComponents
{
  v10[1] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(NSString *)self length];
  MEMORY[0x1F4188790](v3);
  NSUInteger v6 = (_WORD *)((char *)v10 - v5);
  if (v7 > 0x100) {
    NSUInteger v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v10 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3);
  __int16 v8 = (NSArray *)_NSPathComponents(v6, v3);
  if (v3 >= 0x101) {
    free(v6);
  }
  return v8;
}

+ (NSString)stringWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  uint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithCharacters:characters length:length];

  return (NSString *)v4;
}

- (NSString)substringToIndex:(NSUInteger)to
{
  NSUInteger v6 = [(NSString *)self length];
  if (v6 < to)
  {
    __int16 v8 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Index %lu out of bounds; string length %lu",
                     _NSMethodExceptionProem((objc_class *)self, a2),
                     to,
                     v6),
                   0);
    objc_exception_throw(v8);
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", 0, to);
}

- (NSString)stringByApplyingTransform:(NSStringTransform)transform reverse:(BOOL)reverse
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  if (CFStringTransform(Mutable, 0, (CFStringRef)transform, reverse))
  {
    return (NSString *)Mutable;
  }
  else
  {

    return 0;
  }
}

- (id)_web_HTTPStyleLanguageCode
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (CFBundleGetLocalizationInfoForLocalization())
  {
    unint64_t v3 = (void *)CFBundleCopyLocalizationForLocalizationInfo();
    if (v3) {
      self = v3;
    }
  }
  uint64_t v4 = [(NSString *)self lowercaseString];
  if ([(NSString *)v4 length] >= 3 && [(NSString *)v4 characterAtIndex:2] == 95)
  {
    uint64_t v5 = (void *)[(NSString *)v4 mutableCopy];
    objc_msgSend(v5, "replaceCharactersInRange:withString:", 2, 1, @"-");
    return v5;
  }
  return v4;
}

- (NSString)lowercaseString
{
  return [(NSString *)self lowercaseStringWithLocale:0];
}

- (NSString)lowercaseStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringLowercase(Mutable, (CFLocaleRef)locale);

  return (NSString *)Mutable;
}

- (NSString)initWithCoder:(NSCoder *)coder
{
  v10[1] = *MEMORY[0x1E4F143B8];
  if (![(NSCoder *)coder allowsKeyedCoding])
  {
    NSInteger v7 = [(NSCoder *)coder versionForClassName:@"NSString"];
    if (v7 != 1)
    {
      uint64_t v9 = +[NSString stringWithFormat:@"NSString cannot decode class version %lu", v7];

      objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3A8] reason:v9 userInfo:0]);
    }
    v10[0] = 0;
    __int16 v8 = [(NSCoder *)coder decodeBytesWithReturnedLength:v10];
    return [(NSString *)self initWithBytes:v8 length:v10[0] encoding:4];
  }
  if (![(NSCoder *)coder containsValueForKey:@"NS.string"])
  {
    v10[0] = 0;
    __int16 v8 = [(NSCoder *)coder decodeBytesForKey:@"NS.bytes" returnedLength:v10];
    return [(NSString *)self initWithBytes:v8 length:v10[0] encoding:4];
  }
  uint64_t v5 = [(NSCoder *)coder _decodePropertyListForKey:@"NS.string"];
  if (_NSIsNSString())
  {
    return [(NSString *)self initWithString:v5];
  }
  else
  {
    [(NSCoder *)coder failWithError:+[NSError _readCorruptErrorWithFormat:@"Decoded object is not a string"]];

    return 0;
  }
}

- (NSRange)rangeOfCharacterFromSet:(NSCharacterSet *)searchSet
{
  NSUInteger v5 = [(NSString *)self length];

  NSUInteger v6 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", searchSet, 0, 0, v5);
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (NSArray)componentsSeparatedByCharactersInSet:(NSCharacterSet *)separator
{
  uint64_t v5 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", separator, 0, 0, [(NSString *)self length]);
  if (v6)
  {
    uint64_t v7 = v5;
    uint64_t v8 = v6;
    NSUInteger v9 = [(NSString *)self length];
    uint64_t v10 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    uint64_t v11 = [(NSString *)self zone];
    uint64_t v12 = 0;
    do
    {
      id v13 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v7 - v12, v11);
      [(NSArray *)v10 addObject:v13];

      uint64_t v12 = v7 + v8;
      NSUInteger v14 = v9 - (v7 + v8);
      uint64_t v7 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", separator, 0, v7 + v8, v14);
      uint64_t v8 = v15;
    }
    while (v15);
    id v16 = -[NSString _newSubstringWithRange:zone:](self, "_newSubstringWithRange:zone:", v12, v14, v11);
    [(NSArray *)v10 addObject:v16];
  }
  else
  {
    id v16 = (id)[(NSString *)self copy];
    uint64_t v10 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObject:v16];
  }

  return v10;
}

- (NSString)stringByReplacingOccurrencesOfString:(NSString *)target withString:(NSString *)replacement
{
  NSUInteger v7 = [(NSString *)self length];

  return -[NSString stringByReplacingOccurrencesOfString:withString:options:range:](self, "stringByReplacingOccurrencesOfString:withString:options:range:", target, replacement, 0, 0, v7);
}

- (NSString)uppercaseString
{
  return [(NSString *)self uppercaseStringWithLocale:0];
}

- (NSString)uppercaseStringWithLocale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringUppercase(Mutable, (CFLocaleRef)locale);

  return (NSString *)Mutable;
}

- (NSUInteger)maximumLengthOfBytesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc) {
      return 0;
    }
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", enc);
    }
    CFStringEncoding v5 = 1536;
  }
  NSUInteger result = CFStringGetMaximumSizeForEncoding([(NSString *)self length], v5);
  if (result == -1) {
    return 0;
  }
  return result;
}

- (void)getCharacters:(unichar *)buffer
{
  NSUInteger v5 = [(NSString *)self length];

  -[NSString getCharacters:range:](self, "getCharacters:range:", buffer, 0, v5);
}

- (NSRange)paragraphRangeForRange:(NSRange)range
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  v6[0] = 0;
  -[NSString getParagraphStart:end:contentsEnd:forRange:](self, "getParagraphStart:end:contentsEnd:forRange:", v6, &v5, 0, range.location, range.length);
  NSUInteger v3 = v6[0];
  NSUInteger v4 = v5 - v6[0];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)getParagraphStart:(NSUInteger *)startPtr end:(NSUInteger *)parEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
}

- (void)enumerateSubstringsInRange:(NSRange)range options:(NSStringEnumerationOptions)opts usingBlock:(void *)block
{
  unint64_t length = range.length;
  unint64_t location = range.location;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  BOOL v9 = (opts & 0x800) == 0;
  unint64_t v10 = range.location + range.length;
  if ((opts & 0x100) != 0) {
    NSUInteger v11 = range.location + range.length - 1;
  }
  else {
    NSUInteger v11 = range.location;
  }
  char v72 = 0;
  unint64_t v12 = [(NSString *)self length];
  if (v12 < length || location > v12 - length)
  {
    v55 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                      _NSMethodExceptionProem((objc_class *)self, a2),
                      location,
                      length,
                      v12),
                    0);
    objc_exception_throw(v55);
  }
  if (!length) {
    return;
  }
  v70 = 0;
  v71 = 0;
  if ((unint64_t)opts - 3 > 1)
  {
    CFIndex v59 = 0;
    v60 = 0;
    v56 = 0;
    uint64_t v57 = 0;
    uint64_t v58 = 0;
    unint64_t v61 = 0;
    cf = 0;
  }
  else
  {
    if ((opts & 0x100) == 0)
    {
      id v13 = (void (**)(void *, __CFStringTokenizer *))&__block_literal_global_56;
      if (opts != 4) {
        id v13 = 0;
      }
      if (opts == 3) {
        CFOptionFlags v14 = 4;
      }
      else {
        CFOptionFlags v14 = opts == 4;
      }
      if (opts == 3) {
        uint64_t v15 = (void (**)(void *, __CFStringTokenizer *))&__block_literal_global_49;
      }
      else {
        uint64_t v15 = v13;
      }
      v60 = v15;
      if ((opts & 0x400) != 0) {
        CFLocaleRef System = 0;
      }
      else {
        CFLocaleRef System = CFLocaleGetSystem();
      }
      if ((opts & 0x800) != 0)
      {
        v75.unint64_t location = 0;
        v75.unint64_t length = v12;
        long long v20 = CFStringTokenizerCreate(0, (CFStringRef)self, v75, v14, System);
        if (CFStringTokenizerGoToTokenAtIndex(v20, location)) {
          goto LABEL_33;
        }
      }
      else
      {
        v74.unint64_t location = location;
        v74.unint64_t length = length;
        long long v20 = CFStringTokenizerCreate(0, (CFStringRef)self, v74, v14, System);
      }
      v60[2](v60, v20);
LABEL_33:
      cf = v20;
      CFRange CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v20);
      CFIndex v59 = CurrentTokenRange.length;
      unint64_t v61 = CurrentTokenRange.location;
      v56 = 0;
      uint64_t v57 = 0;
      uint64_t v58 = 0;
      if (CurrentTokenRange.location == -1)
      {
        char v72 = 1;
        unint64_t v61 = -1;
      }
      goto LABEL_38;
    }
    v68[0] = MEMORY[0x1E4F143A8];
    v68[1] = 3221225472;
    v68[2] = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3;
    v68[3] = &unk_1E51FA7B0;
    BOOL v69 = v9;
    if (length >= 0x186A0) {
      unint64_t v17 = 100000;
    }
    else {
      unint64_t v17 = length;
    }
    if (length <= 0x186A0) {
      uint64_t v18 = location;
    }
    else {
      uint64_t v18 = v10 - 100000;
    }
    v68[6] = opts;
    v68[7] = location;
    v68[8] = length;
    v68[9] = v10;
    v68[4] = self;
    v68[5] = opts;
    uint64_t v57 = v18;
    uint64_t v19 = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3((uint64_t)v68, (void **)&v71, (void **)&v70, v18, v17);
    CFIndex v59 = 0;
    v60 = 0;
    if (v19)
    {
      unint64_t v61 = 0;
      cf = 0;
      uint64_t v58 = v19 - 1;
    }
    else
    {
      uint64_t v58 = 0;
      unint64_t v61 = 0;
      cf = 0;
      char v72 = 1;
    }
    v56 = v68;
  }
LABEL_38:
  _CFAutoreleasePoolPush();
  if (v72)
  {
LABEL_39:
    _CFAutoreleasePoolPop();
    NSUInteger v22 = cf;
    if (cf) {
      goto LABEL_40;
    }
    goto LABEL_41;
  }
  uint64_t v23 = 0;
  while (1)
  {
    long long v67 = 0uLL;
    unint64_t v65 = 0;
    unint64_t v66 = 0;
    if (opts > 6u)
    {
      id v38 = 0;
      unint64_t v29 = 0;
LABEL_77:
      long long v67 = xmmword_18235A300;
      unint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_110;
    }
    if (((1 << opts) & 0x64) != 0) {
      break;
    }
    if (((1 << opts) & 3) != 0)
    {
      -[NSString _getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:](self, "_getBlockStart:end:contentsEnd:forRange:stopAtLineSeparators:", &v67, &v65, &v66, v11, 0, opts == 0);
      if ((opts & 0x800) != 0)
      {
        unint64_t v24 = v66;
        unint64_t v25 = v67;
        unint64_t v26 = v65;
      }
      else
      {
        unint64_t v24 = v66;
        unint64_t v25 = v67;
        if ((unint64_t)v67 < location)
        {
          *(void *)&long long v67 = location;
          unint64_t v25 = location;
          if (v66 < location)
          {
            unint64_t v66 = location;
            unint64_t v24 = location;
            unint64_t v25 = location;
          }
        }
        unint64_t v26 = v65;
        if (v65 > v10)
        {
          unint64_t v65 = v10;
          if (v24 <= v10)
          {
            unint64_t v26 = v10;
          }
          else
          {
            unint64_t v66 = v10;
            unint64_t v26 = v10;
            unint64_t v24 = v10;
          }
        }
      }
      unint64_t v35 = v24 - v25;
      *((void *)&v67 + 1) = v24 - v25;
      unint64_t v29 = v26 - v25;
      if ((opts & 0x200) == 0)
      {
        long long v33 = self;
        uint64_t v34 = v25;
        goto LABEL_108;
      }
      goto LABEL_109;
    }
    if ((opts & 0x100) == 0)
    {
      if ((opts & 0x800) != 0)
      {
        CFIndex v37 = v59;
        NSUInteger v36 = v61;
      }
      else
      {
        NSUInteger v36 = v61;
        CFIndex v37 = v59;
        if (v61 <= location) {
          NSUInteger v36 = location;
        }
        if (v61 + v59 > v10) {
          CFIndex v37 = v10 - v36;
        }
      }
      *(void *)&long long v67 = v36;
      *((void *)&v67 + 1) = v37;
      if (v36 >= v11) {
        unint64_t v25 = v11;
      }
      else {
        unint64_t v25 = v36;
      }
      uint64_t v44 = ((uint64_t (*)(void *, __CFStringTokenizer *))v60[2])(v60, cf);
      CFRange v46 = CFStringTokenizerGetCurrentTokenRange(cf);
      CFIndex v45 = v46.location;
      CFIndex v59 = v46.length;
      if (v44)
      {
        CFIndex v47 = v46.location;
        if (v46.location > v10)
        {
LABEL_94:
          CFIndex v47 = *((void *)&v67 + 1) + v67;
          if (*((void *)&v67 + 1) + (void)v67 <= v10) {
            CFIndex v47 = v10;
          }
        }
      }
      else
      {
        CFIndex v47 = v10;
        if ((opts & 0x800) != 0) {
          goto LABEL_94;
        }
      }
      unint64_t v29 = v47 - v25;
      goto LABEL_101;
    }
    if (v58 || v57 == location)
    {
      long long v67 = v71[v58];
      v48 = &v70[2 * v58];
      unint64_t v25 = *v48;
      unint64_t v29 = v48[1];
      --v58;
      if (v29 + *v48 > v11)
      {
        unint64_t v29 = v11 + 1 - v25;
        if (*((void *)&v67 + 1) + (void)v67 > v11) {
          *((void *)&v67 + 1) = v11 + 1 - v67;
        }
      }
      CFIndex v45 = v61;
LABEL_101:
      unint64_t v61 = v45;
      if ((opts & 0x200) == 0)
      {
        unint64_t v35 = *((void *)&v67 + 1);
        uint64_t v34 = v67;
        long long v33 = self;
        goto LABEL_108;
      }
      goto LABEL_109;
    }
    unint64_t v39 = v70[1];
    unint64_t v40 = v39 + 100000;
    if (v39 >> 5 < 0xC35) {
      unint64_t v40 = 100000;
    }
    unint64_t v41 = v39 + *v70;
    if (v41 > v40 && v41 - v40 > location) {
      unint64_t v42 = v41 - v40;
    }
    else {
      unint64_t v42 = location;
    }
    uint64_t v57 = v42;
    uint64_t v43 = ((uint64_t (*)(void *, _OWORD **, void **))v56[2])(v56, &v71, &v70);
    if (!v43)
    {
      id v38 = 0;
      unint64_t v29 = 0;
      uint64_t v58 = 0;
      goto LABEL_77;
    }
    uint64_t v58 = v43 - 1;
LABEL_128:
    if (v72) {
      goto LABEL_39;
    }
  }
  unint64_t RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
  unint64_t v25 = RangeOfCharacterClusterAtIndex;
  unint64_t v29 = v28;
  if ((opts & 0x800) == 0)
  {
    if (RangeOfCharacterClusterAtIndex <= location) {
      unint64_t v30 = location;
    }
    else {
      unint64_t v30 = RangeOfCharacterClusterAtIndex;
    }
    unint64_t v31 = location - RangeOfCharacterClusterAtIndex;
    if (location < RangeOfCharacterClusterAtIndex) {
      unint64_t v31 = 0;
    }
    unint64_t v32 = v28 - v31;
    if (v32 + v30 <= v10) {
      unint64_t v29 = v32;
    }
    else {
      unint64_t v29 = v10 - v30;
    }
    unint64_t v25 = v30;
  }
  *(void *)&long long v67 = v25;
  *((void *)&v67 + 1) = v29;
  if ((opts & 0x200) == 0)
  {
    long long v33 = self;
    uint64_t v34 = v25;
    unint64_t v35 = v29;
LABEL_108:
    id v38 = -[NSString _newSubstringWithRange:zone:](v33, "_newSubstringWithRange:zone:", v34, v35, 0);
    goto LABEL_110;
  }
LABEL_109:
  id v38 = 0;
LABEL_110:
  (*((void (**)(void *, id, void, void, unint64_t, unint64_t, char *))block + 2))(block, v38, v67, *((void *)&v67 + 1), v25, v29, &v72);
  if (v38) {

  }
  if (v72) {
    goto LABEL_39;
  }
  if ((opts & 0x100) != 0)
  {
    if (v25 <= location) {
      goto LABEL_39;
    }
    NSUInteger v11 = v25 - 1;
LABEL_125:
    if (v23 == 1000)
    {
      _CFAutoreleasePoolPop();
      _CFAutoreleasePoolPush();
      uint64_t v23 = 0;
    }
    else
    {
      ++v23;
    }
    goto LABEL_128;
  }
  NSUInteger v49 = [(NSString *)self length];
  NSUInteger v50 = v49 - v12;
  if (v49 == v12)
  {
    unint64_t v51 = v12;
    goto LABEL_124;
  }
  unint64_t v51 = v49;
  v29 += v50;
  v10 += v50;
  NSUInteger v22 = cf;
  if (!cf)
  {
LABEL_124:
    NSUInteger v11 = v29 + v25;
    unint64_t v12 = v51;
    if (v29 + v25 >= v10) {
      goto LABEL_39;
    }
    goto LABEL_125;
  }
  v52.unint64_t location = v29 + v25;
  if ((opts & 0x800) != 0) {
    NSUInteger v53 = v49;
  }
  else {
    NSUInteger v53 = v10;
  }
  v52.unint64_t length = v53 - v52.location;
  CFStringTokenizerSetString(cf, (CFStringRef)self, v52);
  v60[2](v60, cf);
  CFRange v54 = CFStringTokenizerGetCurrentTokenRange(cf);
  unint64_t v61 = v54.location;
  if (v54.location != -1)
  {
    CFIndex v59 = v54.length;
    goto LABEL_124;
  }
  _CFAutoreleasePoolPop();
LABEL_40:
  CFRelease(v22);
LABEL_41:
  if (v71) {
    free(v71);
  }
  if (v70) {
    free(v70);
  }
}

- (void)_getBlockStart:(unint64_t *)a3 end:(unint64_t *)a4 contentsEnd:(unint64_t *)a5 forRange:(_NSRange)a6 stopAtLineSeparators:(BOOL)a7
{
  BOOL v7 = a7;
  NSUInteger length = a6.length;
  NSUInteger location = a6.location;
  id v13 = (objc_class *)self;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  unint64_t v14 = [(NSString *)self length];
  long long v48 = 0u;
  long long v46 = 0u;
  memset(v47, 0, sizeof(v47));
  long long v45 = 0u;
  if (v14 < length || location > v14 - length)
  {
    if (_CFExecutableLinkedOnOrAfter())
    {
      unint64_t v41 = objc_msgSend(MEMORY[0x1E4F1CA00], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E4F1C4A8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: Range {%lu, %lu} out of bounds; string length %lu",
                        _NSMethodExceptionProem(v13, a2),
                        location,
                        length,
                        v14),
                      0);
      objc_exception_throw(v41);
    }
    if ((_getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce & 1) == 0)
    {
      _getBlockStart_end_contentsEnd_forRange_stopAtLineSeparators__warnonce = 1;
      uint64_t v15 = _NSMethodExceptionProem(v13, a2);
      v50.NSUInteger location = location;
      v50.NSUInteger length = length;
      id v16 = NSStringFromRange(v50);
      NSLog((NSString *)@"*** %@: Invalid range %@; this will become an exception for apps linked on SnowLeopard. Warning shown once per app execution.",
        v15,
        v16);
    }
  }
  if (location)
  {
    if (a3)
    {
      unint64_t v42 = a4;
      uint64_t v43 = v13;
      *((void *)&v46 + 1) = v14;
      *(void *)&v47[0] = location;
      *(void *)&long long v46 = v13;
      if (v14 <= location)
      {
        int v18 = 0xFFFF;
        WORD4(v48) = -1;
        unint64_t v19 = location;
      }
      else
      {
        if (v14 - location >= 0x20) {
          uint64_t v17 = 32;
        }
        else {
          uint64_t v17 = v14 - location;
        }
        *(void *)&long long v45 = v17;
        objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, location, v17);
        int v18 = WORD4(v47[0]);
        unint64_t v19 = *(void *)&v47[0];
        WORD4(v48) = WORD4(v47[0]);
        id v13 = (objc_class *)v46;
      }
      if (v19 >= 0x20) {
        uint64_t v21 = 32;
      }
      else {
        uint64_t v21 = v19;
      }
      *(void *)&long long v45 = v21;
      *((void *)&v45 + 1) = v21;
      *(void *)&v47[0] = v19 - v21;
      objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v19 - v21, v21);
      unint64_t v22 = v21;
      int v23 = *((unsigned __int16 *)v47 + v21 + 3);
      WORD4(v48) = *((_WORD *)v47 + v21 + 3);
      if (v18 == 10)
      {
        id v13 = v43;
        if (v23 == 13)
        {
          if (*((void *)&v45 + 1) < 2uLL)
          {
            unint64_t v22 = *(void *)&v47[0];
            if (*(void *)&v47[0])
            {
              if (*(void *)&v47[0] >= 0x20uLL) {
                uint64_t v25 = 32;
              }
              else {
                uint64_t v25 = *(void *)&v47[0];
              }
              *(void *)&long long v45 = v25;
              *(void *)&v47[0] -= v25;
              id v13 = v43;
              objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, *(void *)&v47[0], v25);
              unint64_t v22 = v25;
              LOWORD(v23) = *((_WORD *)v47 + v25 + 3);
            }
            else
            {
              *((void *)&v45 + 1) = 0;
              LOWORD(v23) = -1;
            }
          }
          else
          {
            --*((void *)&v45 + 1);
            LOWORD(v23) = *((_WORD *)v47 + v21 + 2);
            unint64_t v22 = v21 - 1;
          }
          WORD4(v48) = v23;
        }
      }
      else
      {
        id v13 = v43;
      }
      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v23 - 14) >= 0x77u)
          {
            if ((unsigned __int16)v23 > 0x2027u)
            {
              if ((unsigned __int16)v23 - 8232 < 2) {
                goto LABEL_60;
              }
            }
            else if ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 13 || (unsigned __int16)v23 == 133)
            {
              goto LABEL_60;
            }
          }
        }
        else if ((unsigned __int16)(v23 - 14) >= 0x201Bu {
               && ((unsigned __int16)v23 == 10 || (unsigned __int16)v23 == 8233 || (unsigned __int16)v23 == 13))
        }
        {
LABEL_60:
          unint64_t v24 = *(void *)&v47[0] + v22;
          goto LABEL_62;
        }
        if ((uint64_t)(*(void *)&v47[0] + v22 - 1) < 1) {
          break;
        }
        if (v22 < 2)
        {
          if (*(void *)&v47[0])
          {
            if (*(void *)&v47[0] >= 0x20uLL) {
              uint64_t v26 = 32;
            }
            else {
              uint64_t v26 = *(void *)&v47[0];
            }
            *(void *)&long long v45 = v26;
            *(void *)&v47[0] -= v26;
            id v13 = v43;
            objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, *(void *)&v47[0], v26);
            unint64_t v22 = v26;
            LOWORD(v23) = *((_WORD *)v47 + v26 + 3);
          }
          else
          {
            unint64_t v22 = 0;
            *((void *)&v45 + 1) = 0;
            LOWORD(v23) = -1;
          }
        }
        else
        {
          *((void *)&v45 + 1) = v22 - 1;
          LOWORD(v23) = *((_WORD *)v47 + v22-- + 2);
        }
        WORD4(v48) = v23;
      }
      unint64_t v24 = 0;
LABEL_62:
      a4 = v42;
      long long v20 = a3;
      goto LABEL_63;
    }
  }
  else
  {
    long long v20 = a3;
    if (!a5 && v14 == length)
    {
      if (a3) {
        *a3 = 0;
      }
      if (a4) {
        goto LABEL_120;
      }
      return;
    }
    if (a3)
    {
      unint64_t v24 = 0;
LABEL_63:
      unint64_t *v20 = v24;
    }
  }
  if ((unint64_t)a4 | (unint64_t)a5)
  {
    unint64_t v27 = location + length - (length != 0);
    *((void *)&v46 + 1) = v14;
    *(void *)&v47[0] = v27;
    *(void *)&long long v46 = v13;
    if (v14 <= v27)
    {
      unsigned __int16 v32 = -1;
      WORD4(v48) = -1;
      long long v45 = xmmword_182106C90;
LABEL_78:
      unint64_t v33 = 1;
      while (1)
      {
        if (v7)
        {
          if ((unsigned __int16)(v32 - 14) >= 0x77u)
          {
            if (v32 > 0x2027u)
            {
              if (v32 - 8232 < 2) {
                goto LABEL_101;
              }
            }
            else if (v32 == 10 || v32 == 13 || v32 == 133)
            {
              goto LABEL_101;
            }
          }
        }
        else if ((unsigned __int16)(v32 - 14) >= 0x201Bu && (v32 == 10 || v32 == 8233 || v32 == 13))
        {
LABEL_101:
          unint64_t v14 = v33 + *(void *)&v47[0] - 1;
          if (v33 >= (unint64_t)v45)
          {
            uint64_t v38 = v45 + *(void *)&v47[0];
            if (*((void *)&v46 + 1) <= (void)v45 + *(void *)&v47[0])
            {
              *((void *)&v45 + 1) = v45 + 1;
              int v37 = 0xFFFF;
              WORD4(v48) = -1;
            }
            else
            {
              if (*((void *)&v46 + 1) - ((void)v45 + *(void *)&v47[0]) >= 0x20uLL) {
                uint64_t v39 = 32;
              }
              else {
                uint64_t v39 = *((void *)&v46 + 1) - (v45 + *(void *)&v47[0]);
              }
              *(void *)&v47[0] += v45;
              *(void *)&long long v45 = v39;
              objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v38, v39);
              int v37 = WORD4(v47[0]);
              WORD4(v48) = WORD4(v47[0]);
              *((void *)&v45 + 1) = 1;
            }
          }
          else
          {
            *((void *)&v45 + 1) = v33 + 1;
            int v37 = *((unsigned __int16 *)v47 + v33 + 4);
            WORD4(v48) = v37;
          }
          if (v32 == 13)
          {
            BOOL v40 = v37 == 10;
            uint64_t v31 = 1;
            if (v40) {
              uint64_t v31 = 2;
            }
            goto LABEL_116;
          }
LABEL_115:
          uint64_t v31 = 1;
          goto LABEL_116;
        }
        if (v33 + *(void *)&v47[0] - 1 == v14)
        {
          uint64_t v31 = 0;
          goto LABEL_116;
        }
        if (v33 >= (unint64_t)v45)
        {
          uint64_t v35 = v45 + *(void *)&v47[0];
          if (*((void *)&v46 + 1) > (void)v45 + *(void *)&v47[0])
          {
            if (*((void *)&v46 + 1) - ((void)v45 + *(void *)&v47[0]) >= 0x20uLL) {
              uint64_t v36 = 32;
            }
            else {
              uint64_t v36 = *((void *)&v46 + 1) - (v45 + *(void *)&v47[0]);
            }
            *(void *)&v47[0] += v45;
            *(void *)&long long v45 = v36;
            objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v35, v36);
            unsigned __int16 v32 = WORD4(v47[0]);
            WORD4(v48) = WORD4(v47[0]);
            *((void *)&v45 + 1) = 1;
            goto LABEL_78;
          }
          unint64_t v33 = v45 + 1;
          *((void *)&v45 + 1) = v45 + 1;
          unsigned __int16 v32 = -1;
          WORD4(v48) = -1;
        }
        else
        {
          uint64_t v34 = (char *)&v45 + 2 * v33++;
          *((void *)&v45 + 1) = v33;
          unsigned __int16 v32 = *((_WORD *)v34 + 20);
          WORD4(v48) = v32;
        }
      }
    }
    if (v14 - v27 >= 0x20) {
      uint64_t v28 = 32;
    }
    else {
      uint64_t v28 = v14 - v27;
    }
    *(void *)&long long v45 = v28;
    objc_msgSend(v13, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v27, v28);
    unsigned __int16 v32 = WORD4(v47[0]);
    WORD4(v48) = WORD4(v47[0]);
    *((void *)&v45 + 1) = 1;
    if (WORD4(v47[0]) != 10) {
      goto LABEL_78;
    }
    uint64_t v29 = *(void *)&v47[0];
    if (!*(void *)&v47[0])
    {
      unint64_t v14 = 0;
      goto LABEL_115;
    }
    if (*(void *)&v47[0] >= 0x20uLL) {
      uint64_t v30 = 32;
    }
    else {
      uint64_t v30 = *(void *)&v47[0];
    }
    *(void *)&long long v45 = v30;
    *((void *)&v45 + 1) = v30;
    *(void *)&v47[0] -= v30;
    objc_msgSend((id)v46, sel_getUid("getCharacters:range:"), (char *)v47 + 8, v29 - v30, v30);
    uint64_t v31 = 1;
    if (*((_WORD *)v47 + v30 + 3) == 13) {
      uint64_t v31 = 2;
    }
    unint64_t v14 = v29 - (*((_WORD *)v47 + *((void *)&v45 + 1) + 3) == 13);
LABEL_116:
    if (a5) {
      *a5 = v14;
    }
    if (a4)
    {
      NSUInteger length = v31 + v14;
LABEL_120:
      *a4 = length;
    }
  }
}

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke(int a1, CFStringTokenizerRef tokenizer)
{
  do
  {
    while (1)
    {
      CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
      CFStringTokenizerTokenType v4 = Token;
      if (!Token) {
        break;
      }
      if ((Token & 0x10) == 0) {
        return v4;
      }
    }
  }
  while (CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return v4;
}

+ (NSStringEncoding)defaultCStringEncoding
{
  if (__NSDefaultStringEncodingFullyInited) {
    return _NSDefaultStringEncoding;
  }
  else {
    return _NSDefaultCStringEncoding();
  }
}

- (BOOL)localizedCaseInsensitiveContainsString:(NSString *)str
{
  NSUInteger v5 = [(NSString *)self length];
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 1, 0, v5, [MEMORY[0x1E4F1CA20] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    if (!__NSDefaultStringEncodingFullyInited) {
      _NSDefaultCStringEncoding();
    }
    Class v3 = objc_lookUpClass("NSTaggedPointerString");
    if (v3)
    {
      CFStringTokenizerTokenType v4 = v3;
      if (dyld_program_sdk_at_least())
      {
        if (getenv("NSStringDisableTagged")) {
          return;
        }
      }
      else if (!getenv("NSStringEnableTagged"))
      {
        return;
      }
      class_setSuperclass(v4, (Class)a1);
      [(objc_class *)v4 _setAsTaggedStringClass];
    }
  }
}

- (BOOL)containsString:(NSString *)str
{
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 0, 0, [(NSString *)self length], 0) != 0x7FFFFFFFFFFFFFFFLL;
}

+ (NSString)pathWithComponents:(NSArray *)components
{
  return (NSString *)+[NSPathStore2 pathWithComponents:components];
}

- (NSRange)rangeOfComposedCharacterSequencesForRange:(NSRange)range
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  NSUInteger v6 = [(NSString *)self length];
  if (location == v6) {
    uint64_t v7 = location;
  }
  else {
    uint64_t v7 = [(NSString *)self rangeOfComposedCharacterSequenceAtIndex:location];
  }
  if (location + length != v6)
  {
    if (length) {
      uint64_t v8 = location + length - 1;
    }
    else {
      uint64_t v8 = location;
    }
    uint64_t v9 = [(NSString *)self rangeOfComposedCharacterSequenceAtIndex:v8];
    NSUInteger v6 = v9 + v10;
  }
  NSUInteger v11 = v6 - v7;
  NSUInteger v12 = v7;
  result.NSUInteger length = v11;
  result.NSUInteger location = v12;
  return result;
}

- (NSString)commonPrefixWithString:(NSString *)str options:(NSStringCompareOptions)mask
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(NSString *)self length];
  uint64_t v25 = str;
  int64_t v6 = [(NSString *)str length];
  NSRange result = (NSString *)&stru_1ECA5C228;
  if (v5 && v6)
  {
    uint64_t v8 = [(NSString *)self _fastCharacterContents];
    if (v8)
    {
      uint64_t v9 = (UniChar *)v8;
      int v23 = 0;
      unint64_t v10 = v5;
    }
    else if (v5 < 101)
    {
      unint64_t v10 = 0;
      int v23 = 0;
      uint64_t v9 = (UniChar *)&v28;
    }
    else
    {
      NSUInteger v11 = malloc_default_zone();
      uint64_t v9 = (UniChar *)malloc_type_zone_malloc(v11, 2 * v5, 0x4A6F13AEuLL);
      unint64_t v10 = 0;
      int v23 = 1;
    }
    uint64_t v12 = 0;
    unint64_t v13 = 0;
    MutableWithExternalCharactersNoCopy = 0;
    if (v5 >= 0) {
      uint64_t v15 = v5;
    }
    else {
      uint64_t v15 = v5 + 1;
    }
    uint64_t v16 = v15 >> 1;
    if (v16 >= v6) {
      uint64_t v17 = v6;
    }
    else {
      uint64_t v17 = v16;
    }
    CFAllocatorRef externalCharactersAllocator = (const __CFAllocator *)*MEMORY[0x1E4F1CFA0];
    while (1)
    {
      if ((mask & 2) != 0)
      {
        unint64_t v20 = v17 + 1;
      }
      else
      {
        uint64_t v18 = [(NSString *)self rangeOfComposedCharacterSequenceAtIndex:v17];
        unint64_t v20 = v18 + v19;
      }
      if (v20 > v10)
      {
        -[NSString getCharacters:range:](self, "getCharacters:range:", &v9[v10], v10, v20 - v10);
        unint64_t v10 = v20;
      }
      if (MutableWithExternalCharactersNoCopy) {
        CFStringSetExternalCharactersNoCopy(MutableWithExternalCharactersNoCopy, v9, v20, v20);
      }
      else {
        MutableWithExternalCharactersNoCopy = CFStringCreateMutableWithExternalCharactersNoCopy(0, v9, v20, v20, externalCharactersAllocator);
      }
      -[NSString rangeOfString:options:range:](v25, "rangeOfString:options:range:", MutableWithExternalCharactersNoCopy, mask | 8, 0, v6);
      if (v21) {
        uint64_t v12 = v17 + 1;
      }
      else {
        uint64_t v5 = v17;
      }
      if (v21) {
        unint64_t v13 = v20;
      }
      if (v12 >= v5) {
        break;
      }
      uint64_t v22 = v12 + v5;
      if (v12 + v5 < 0 != __OFADD__(v12, v5)) {
        ++v22;
      }
      uint64_t v17 = v22 >> 1;
    }
    CFRelease(MutableWithExternalCharactersNoCopy);
    if (v23) {
      free(v9);
    }
    if (v13) {
      return -[NSString substringWithRange:](self, "substringWithRange:", 0, v13);
    }
    else {
      return (NSString *)&stru_1ECA5C228;
    }
  }
  return result;
}

- (NSRange)rangeOfComposedCharacterSequenceAtIndex:(NSUInteger)index
{
  if ([(NSString *)self length] <= index)
  {
    int64_t v6 = +[NSString stringWithFormat:@"The index %ld is invalid", index];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v6 userInfo:0]);
  }

  NSUInteger RangeOfCharacterClusterAtIndex = CFStringGetRangeOfCharacterClusterAtIndex();
  result.NSUInteger length = v5;
  result.NSUInteger location = RangeOfCharacterClusterAtIndex;
  return result;
}

- (NSComparisonResult)localizedStandardCompare:(NSString *)string
{
  NSUInteger v5 = [(NSString *)self length];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];

  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 833, 0, v5, v6);
}

- (NSString)stringByExpandingTildeInPath
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ((int64_t)[(NSString *)self length] > 1023) {
    NSUInteger v3 = 1024;
  }
  else {
    NSUInteger v3 = [(NSString *)self length];
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v8, 0, v3);
  _NSExpandTildeInPath((uint64_t)v8, (unint64_t *)&v7);
  _NSTransmutePathSlashes(v8, &v7);
  unint64_t v4 = v7;
  if (v7 >= 2 && v8[v7 - 1] == 47)
  {
    while (v4 > 2)
    {
      int v5 = (unsigned __int16)v8[v4-- - 2];
      if (v5 != 47) {
        return (NSString *)+[NSPathStore2 pathStoreWithCharacters:v8 length:v4];
      }
    }
    unint64_t v4 = 1;
  }
  return (NSString *)+[NSPathStore2 pathStoreWithCharacters:v8 length:v4];
}

- (NSRange)rangeOfString:(NSString *)searchString options:(NSStringCompareOptions)mask
{
  NSUInteger v7 = [(NSString *)self length];

  NSUInteger v8 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", searchString, mask, 0, v7, 0);
  result.NSUInteger length = v9;
  result.NSUInteger location = v8;
  return result;
}

- (NSData)dataUsingEncoding:(NSStringEncoding)encoding
{
  return [(NSString *)self dataUsingEncoding:encoding allowLossyConversion:0];
}

- (NSString)stringByAddingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      CFStringEncoding v5 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", enc);
      }
      CFStringEncoding v5 = 1536;
    }
  }
  uint64_t v6 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, 0, 0, v5);

  return (NSString *)v6;
}

- (NSString)stringByRemovingPercentEncoding
{
  int v2 = (void *)_CFStringCreateByRemovingPercentEncoding();

  return (NSString *)v2;
}

- (NSString)initWithCharacters:(const unichar *)characters length:(NSUInteger)length
{
  unint64_t v4 = self;
  if (length)
  {
    NSUInteger v5 = length;
    NSUInteger v7 = (malloc_zone_t *)[(NSString *)self zone];
    if (!v7) {
      NSUInteger v7 = malloc_default_zone();
    }
    NSUInteger v8 = malloc_type_zone_malloc(v7, 2 * v5, 0x4A6F13AEuLL);
    memmove(v8, characters, 2 * v5);
    self = v4;
    NSUInteger v9 = v8;
    NSUInteger length = v5;
    uint64_t v10 = 1;
  }
  else
  {
    NSUInteger v9 = 0;
    uint64_t v10 = 0;
  }

  return [(NSString *)self initWithCharactersNoCopy:v9 length:length freeWhenDone:v10];
}

- (double)doubleValue
{
  v5[1] = *(double *)MEMORY[0x1E4F143B8];
  unint64_t v4 = 0;
  v5[0] = 0.0;
  int v2 = _NSScanDoubleFromString(self, +[NSCharacterSet whitespaceCharacterSet], v5, &v4, 0);
  double result = v5[0];
  if (!v2) {
    return 0.0;
  }
  return result;
}

- (NSString)stringByDeletingPathExtension
{
  v14[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  v14[0] = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (_WORD *)((char *)v14 - v5);
  if (v7 > 0x100) {
    uint64_t v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v14 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3, v14[0]);
  _NSTransmutePathSlashes(v6, v14);
  unint64_t v8 = v14[0];
  if (v14[0] >= 2 && v6[v14[0] - 1] == 47)
  {
    while (v8 > 2)
    {
      int v9 = (unsigned __int16)v6[v8-- - 2];
      if (v9 != 47) {
        goto LABEL_10;
      }
    }
    unint64_t v8 = 1;
  }
LABEL_10:
  uint64_t v10 = _NSStartOfPathExtension((uint64_t)v6, v8);
  if (v10 <= 0) {
    unint64_t v11 = v8;
  }
  else {
    unint64_t v11 = v10;
  }
  uint64_t v12 = +[NSPathStore2 pathStoreWithCharacters:v6 length:v11];
  if (v3 >= 0x101) {
    free(v6);
  }
  return v12;
}

- (BOOL)_web_looksLikeIPAddress
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (![(NSString *)self length]) {
    return 0;
  }
  unsigned int v3 = [(NSString *)self characterAtIndex:0];
  if (v3 != 58 && (v3 > 0xFF || (*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v3 + 60) & 0x10000) == 0)) {
    return 0;
  }
  if ([(NSString *)self isEqualToString:@"."]) {
    return 0;
  }
  if (![(NSString *)self canBeConvertedToEncoding:1]) {
    return 0;
  }
  uint64_t v4 = [(NSString *)self cStringUsingEncoding:1];
  BOOL v5 = v4 != 0;
  if (v4)
  {
    uint64_t v6 = v4;
    if (inet_pton(2, v4, v8) != 1 && inet_pton(30, v6, v8) != 1) {
      return 0;
    }
  }
  return v5;
}

- (BOOL)canBeConvertedToEncoding:(NSStringEncoding)encoding
{
  if (encoding < 0xB && ((0x491u >> encoding) & 1) != 0) {
    return 1;
  }
  if (CFStringConvertNSStringEncodingToEncoding(encoding) != -1)
  {
LABEL_7:
    [(NSString *)self length];
    uint64_t v5 = __CFStringEncodeByteStream();
    return v5 == [(NSString *)self length];
  }
  if (encoding == 134217984)
  {
    if (_CFExecutableLinkedOnOrAfter()) {
      NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", 134217984);
    }
    goto LABEL_7;
  }
  return 0;
}

- (NSString)stringByResolvingSymlinksInPath
{
  return (NSString *)[(NSString *)self _stringByResolvingSymlinksInPathUsingCache:0];
}

- (NSString)stringByPaddingToLength:(NSUInteger)newLength withString:(NSString *)padString startingAtIndex:(NSUInteger)padIndex
{
  NSUInteger v10 = [(NSString *)self length];
  if (v10 < newLength)
  {
    NSUInteger v11 = [(NSString *)padString length];
    if (v11)
    {
      if (v11 > padIndex)
      {
        MutableCopy = CFStringCreateMutableCopy((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (CFStringRef)self);
        CFStringPad(MutableCopy, (CFStringRef)padString, newLength, padIndex);
        unint64_t v13 = MutableCopy;
LABEL_7:
        return (NSString *)v13;
      }
      uint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      uint64_t v16 = "out of range padIndex";
    }
    else
    {
      uint64_t v15 = _NSMethodExceptionProem((objc_class *)self, a2);
      uint64_t v16 = "nil or empty padString";
    }
    uint64_t v17 = +[NSString stringWithFormat:@"%@: %s", v15, v16];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v17 userInfo:0]);
  }
  if (v10 == newLength)
  {
    unint64_t v13 = [(NSString *)self copyWithZone:[(NSString *)self zone]];
    goto LABEL_7;
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", 0, newLength);
}

- (NSString)stringByDeletingLastPathComponent
{
  v15[1] = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  v15[0] = v3;
  MEMORY[0x1F4188790](v3);
  uint64_t v6 = (_WORD *)((char *)v15 - v5);
  if (v7 > 0x100) {
    uint64_t v6 = malloc_type_malloc(2 * v4, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v15 - v5, 2 * v4);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v6, 0, v3, v15[0]);
  _NSTransmutePathSlashes(v6, v15);
  uint64_t v8 = v15[0];
  if (v15[0] >= 2)
  {
    if (v6[v15[0] - 1] != 47) {
      goto LABEL_12;
    }
    while ((unint64_t)v8 > 2)
    {
      int v9 = (unsigned __int16)v6[v8-- - 2];
      if (v9 != 47) {
        goto LABEL_8;
      }
    }
    goto LABEL_9;
  }
LABEL_8:
  if (v8 == 1)
  {
LABEL_9:
    uint64_t v10 = *v6 == 47;
    goto LABEL_17;
  }
  if (v8 >= 2)
  {
LABEL_12:
    while (1)
    {
      uint64_t v11 = v8 - 1;
      if (v8 == 1) {
        break;
      }
      int v12 = (unsigned __int16)v6[v8-- - 2];
      if (v12 == 47)
      {
        if (v11 == 1) {
          uint64_t v10 = 1;
        }
        else {
          uint64_t v10 = v11 - 1;
        }
        goto LABEL_17;
      }
    }
  }
  uint64_t v10 = 0;
LABEL_17:
  unint64_t v13 = +[NSPathStore2 pathStoreWithCharacters:v6 length:v10];
  if (v3 >= 0x101) {
    free(v6);
  }
  return v13;
}

- (NSString)precomposedStringWithCanonicalMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormC);

  return (NSString *)Mutable;
}

- (NSString)localizedUppercaseString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];

  return [(NSString *)self uppercaseStringWithLocale:v3];
}

- (id)_copyFormatStringWithConfiguration:(id)a3
{
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    self = (NSString *)[(NSString *)self baseString];
  }
  uint64_t v5 = [__NSLocalizedString alloc];

  return [(__NSLocalizedString *)v5 initWithString:self withFormatConfiguration:a3];
}

+ (NSString)localizedStringWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  va_start(va, error);
  id v8 = objc_alloc((Class)a1);
  return (NSString *)(id)objc_msgSend(v8, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, objc_msgSend(MEMORY[0x1E4F1CA20], "currentLocale"), va, error);
}

- (NSString)localizedCapitalizedString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];

  return [(NSString *)self capitalizedStringWithLocale:v3];
}

+ (NSString)stringWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  uint64_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path encoding:enc error:error];

  return (NSString *)v5;
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  uint64_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url encoding:enc error:error];

  return (NSString *)v5;
}

- (NSString)initWithContentsOfFile:(NSString *)path encoding:(NSStringEncoding)enc error:(NSError *)error
{
  v13[1] = *(void **)MEMORY[0x1E4F143B8];
  if (_NSIsNSURL())
  {
    return [(NSString *)self initWithContentsOfURL:path encoding:enc error:error];
  }
  else
  {
    uint64_t v12 = 0;
    v13[0] = 0;
    char v11 = 0;
    LOBYTE(v10) = 0;
    if ([MEMORY[0x1E4F1C9B8] _readBytesFromPath:path maxLength:0x7FFFFFFFFFFFFFFFLL bytes:v13 length:&v12 didMap:&v11 options:0 reportProgress:v10 error:error])
    {
      if (v12 || v13[0])
      {
        double result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v13[0]);
        if (result) {
          return result;
        }
        free(v13[0]);
        if (error) {
          *error = _NSErrorWithFilePathAndEncoding(261, (uint64_t)path, enc);
        }
      }
      else
      {
        double result = [(NSString *)self init];
        if (result) {
          return result;
        }
      }
    }

    return 0;
  }
}

- (NSString)initWithContentsOfURL:(NSURL *)url encoding:(NSStringEncoding)enc error:(NSError *)error
{
  v15[1] = *(id *)MEMORY[0x1E4F143B8];
  if (![(NSURL *)url isFileURL])
  {
    char v11 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:url cachePolicy:1 timeoutInterval:60.0];
    v15[0] = 0;
    uint64_t v12 = (void *)[MEMORY[0x1E4F18D80] sendSynchronousRequest:v11 returningResponse:v15 error:0];

    if (v15[0] && v12)
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v15[0], "statusCode")) & 1) != 0)
      {
LABEL_10:
        if (error)
        {
          uint64_t v13 = 256;
LABEL_18:
          unint64_t v14 = _NSErrorWithFilePath(v13, (uint64_t)url);
          goto LABEL_19;
        }
LABEL_20:

        return 0;
      }
    }
    else if (!v12)
    {
      goto LABEL_10;
    }
    double result = -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", [v12 bytes], objc_msgSend(v12, "length"), enc);
    if (error && !result)
    {
      unint64_t v14 = _NSErrorWithFilePathAndEncoding(261, (uint64_t)url, enc);
LABEL_19:
      *error = v14;
      goto LABEL_20;
    }
    if (result) {
      return result;
    }
    goto LABEL_20;
  }
  id v9 = [(NSURL *)url _securePath];
  if (!v9)
  {
    if (error)
    {
      uint64_t v13 = 260;
      goto LABEL_18;
    }
    goto LABEL_20;
  }

  return [(NSString *)self initWithContentsOfFile:v9 encoding:enc error:error];
}

- (NSString)initWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  v16[1] = *MEMORY[0x1E4F143B8];
  uint64_t v15 = 0;
  v16[0] = 0;
  NSStringEncoding v14 = 0xFFFFFFFFLL;
  char v13 = 0;
  LOBYTE(v12) = 0;
  if (([MEMORY[0x1E4F1C9B8] _readBytesAndEncodingFromPath:path maxLength:0x7FFFFFFFFFFFFFFFLL encoding:&v14 bytes:v16 length:&v15 didMap:&v13 options:0 reportProgress:v12 error:error] & 1) == 0)
  {
LABEL_19:

    return 0;
  }
  uint64_t v9 = v15;
  uint64_t v10 = v16[0];
  if (v14 == 0xFFFFFFFF || !v16[0] || !v15)
  {
LABEL_10:
    if (v9 || v10)
    {
      double result = -[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:](self, "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:", v10);
    }
    else
    {
      double result = [(NSString *)self init];
      if (enc) {
        *enc = 4;
      }
    }
    if (!error || result)
    {
      if (result) {
        return result;
      }
    }
    else
    {
      *error = _NSErrorWithFilePath(264, (uint64_t)path);
    }
    goto LABEL_19;
  }
  double result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", v16[0], v15);
  if (enc && result)
  {
    *enc = v14;
    return result;
  }
  if (!result)
  {
    uint64_t v9 = v15;
    uint64_t v10 = v16[0];
    goto LABEL_10;
  }
  return result;
}

- (NSString)initWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  v14[1] = *(id *)MEMORY[0x1E4F143B8];
  if (![(NSURL *)url isFileURL])
  {
    char v11 = (void *)[objc_alloc(MEMORY[0x1E4F18DA8]) initWithURL:url cachePolicy:1 timeoutInterval:60.0];
    v14[0] = 0;
    uint64_t v12 = (void *)[MEMORY[0x1E4F18D80] sendSynchronousRequest:v11 returningResponse:v14 error:0];

    if (v14[0] && v12)
    {
      self;
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (objc_msgSend(MEMORY[0x1E4F18D40], "isErrorStatusCode:", objc_msgSend(v14[0], "statusCode")) & 1) != 0)
      {
        goto LABEL_10;
      }
    }
    else if (!v12)
    {
LABEL_10:
      if (!error) {
        goto LABEL_19;
      }
      uint64_t v13 = 256;
      goto LABEL_18;
    }
    double result = -[NSString _initWithBytesOfUnknownEncoding:length:copy:usedEncoding:](self, "_initWithBytesOfUnknownEncoding:length:copy:usedEncoding:", [v12 bytes], objc_msgSend(v12, "length"), 1, enc);
    if (!error || result)
    {
      if (result) {
        return result;
      }
      goto LABEL_19;
    }
    uint64_t v13 = 264;
LABEL_18:
    *error = _NSErrorWithFilePath(v13, (uint64_t)url);
    goto LABEL_19;
  }
  id v9 = [(NSURL *)url _securePath];
  if (!v9)
  {
    if (error)
    {
      uint64_t v13 = 260;
      goto LABEL_18;
    }
LABEL_19:

    return 0;
  }

  return [(NSString *)self initWithContentsOfFile:v9 usedEncoding:enc error:error];
}

- (unsigned)_pathResolveFlags
{
  id v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(self);
  unint64_t v5 = v4;
  uint64_t v6 = self;
  unint64_t v7 = String._pathResolveFlags(prefixLength:)(&v9, (unint64_t)v3, v5);

  swift_bridgeObjectRelease();
  if ((v7 & 0x100000000) != 0) {
    return 0;
  }
  else {
    return v7;
  }
}

- (unsigned)_queryResolveFlags
{
  id v3 = static String._unconditionallyBridgeFromObjectiveC(_:)(self);
  unint64_t v5 = v4;
  uint64_t v6 = self;
  LODWORD(v3) = String._queryResolveFlags()((unint64_t)v3, v5);

  swift_bridgeObjectRelease();
  return v3;
}

- (id)_urlStringByInsertingPathResolveFlags:(unsigned int)a3
{
  return @objc NSString._urlStringByInsertingPathResolveFlags(_:)(self, (uint64_t)a2, *(uint64_t *)&a3, (void (*)(uint64_t))NSString._urlStringByInsertingPathResolveFlags(_:));
}

- (id)_urlStringByInsertingQueryResolveFlags:(unsigned int)a3
{
  return @objc NSString._urlStringByInsertingPathResolveFlags(_:)(self, (uint64_t)a2, *(uint64_t *)&a3, (void (*)(uint64_t))NSString._urlStringByInsertingQueryResolveFlags(_:));
}

- (id)_urlStringByRemovingResolveFlags
{
  int v2 = self;
  NSString._urlStringByRemovingResolveFlags()();

  id v3 = (void *)String._bridgeToObjectiveCImpl()();
  swift_bridgeObjectRelease();

  return v3;
}

- (NSString)variantFittingPresentationWidth:(NSInteger)width
{
  id v3 = self;

  return v3;
}

- (id)_widthVariants
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = self;
  return (id)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (unsigned)_smallestEncodingInCFStringEncoding
{
  unint64_t v2 = [(NSString *)self smallestEncoding];

  return CFStringConvertNSStringEncodingToEncoding(v2);
}

- ($2F068FC02377E22BA03580A8162C781E)decimalValue
{
  _CFAutoreleasePoolPush();
  unint64_t v5 = +[NSScanner scannerWithString:self];
  *(void *)retstr = 0;
  *(void *)&retstr->var5[2] = 0;
  *(_DWORD *)&retstr->var5[6] = 0;
  if (![(NSScanner *)v5 scanDecimal:retstr])
  {
    uint64_t v6 = +[NSDecimalNumber notANumber];
    if (v6)
    {
      [(NSDecimalNumber *)v6 decimalValue];
    }
    else
    {
      long long v8 = 0uLL;
      int v9 = 0;
    }
    *(_OWORD *)retstr = v8;
    *(_DWORD *)&retstr->var5[6] = v9;
  }
  return ($2F068FC02377E22BA03580A8162C781E *)_CFAutoreleasePoolPop();
}

- (id)__escapeString5991
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSString *)self length];
  unint64_t v4 = (__CFString *)objc_opt_new();
  if (v3 >= 1)
  {
    for (uint64_t i = 0; i != v3; ++i)
    {
      int v6 = [(NSString *)self characterAtIndex:i];
      UniChar chars = 92;
      __int16 v11 = v6;
      if ((v6 - 34) <= 0x3B && ((1 << (v6 - 34)) & 0xA00000020000121) != 0)
      {
        p_UniChar chars = &chars;
        CFIndex v8 = 2;
      }
      else
      {
        p_UniChar chars = (UniChar *)&v11;
        CFIndex v8 = 1;
      }
      CFStringAppendCharacters(v4, p_chars, v8);
    }
  }
  return v4;
}

- (NSString)stringByAbbreviatingWithTildeInPath
{
  v12[1] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSString *)self length];
  if (v3 > 1023)
  {
    unint64_t v4 = 1024;
  }
  else
  {
    uint64_t v3 = [(NSString *)self length];
    unint64_t v4 = v3;
  }
  v12[0] = v4;
  MEMORY[0x1F4188790](v3);
  unint64_t v7 = (unsigned __int16 *)((char *)v12 - v6);
  if (v4 > 0x100) {
    unint64_t v7 = (unsigned __int16 *)malloc_type_malloc(2 * v5, 0x1000040BDFB0063uLL);
  }
  else {
    bzero((char *)v12 - v6, 2 * v5);
  }
  -[NSString getCharacters:range:](self, "getCharacters:range:", v7, 0, v4, v12[0]);
  _NSTransmutePathSlashes(v7, v12);
  unint64_t v8 = v12[0];
  if (v12[0] >= 2)
  {
    if (v7[v12[0] - 1] == 47)
    {
      while (v8 > 2)
      {
        int v9 = v7[v8-- - 2];
        if (v9 != 47) {
          goto LABEL_13;
        }
      }
      unint64_t v8 = 1;
    }
LABEL_13:
    v12[0] = v8;
  }
  _NSAbbreviatePathWithTilde(v7, v12);
  uint64_t v10 = +[NSPathStore2 pathStoreWithCharacters:v7 length:v12[0]];
  if (v4 >= 0x101) {
    free(v7);
  }
  return v10;
}

- (NSArray)stringsByAppendingPaths:(NSArray *)paths
{
  if (!paths || (_NSIsNSArray() & 1) == 0)
  {
    __int16 v11 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: paths argument is not an array", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v11);
  }
  if ([(NSString *)self isEqual:&stru_1ECA5C228])
  {
    uint64_t v6 = (void *)[(NSArray *)paths copyWithZone:[(NSString *)self zone]];
    return (NSArray *)v6;
  }
  else
  {
    uint64_t v8 = [(NSArray *)paths count];
    int v9 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
    if (v8 >= 1)
    {
      for (uint64_t i = 0; i != v8; ++i)
        [(NSArray *)v9 addObject:[(NSString *)self stringByAppendingPathComponent:[(NSArray *)paths objectAtIndex:i]]];
    }
    return v9;
  }
}

- (NSUInteger)completePathIntoString:(NSString *)outputName caseSensitive:(BOOL)flag matchesIntoArray:(NSArray *)outputArray filterTypes:(NSArray *)filterTypes
{
  BOOL v84 = flag;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  v83 = +[NSFileManager defaultManager];
  if ([(NSString *)self isEqual:&stru_1ECA5C228]) {
    return 0;
  }
  if ([(NSString *)self hasPrefix:@"~"]
    && [(NSString *)self rangeOfString:@"/", 0, 0, [(NSString *)self length] options range] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v10 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA80]) initWithCapacity:32];
    __int16 v11 = -[NSString substringWithRange:](self, "substringWithRange:", 1, [(NSString *)self length] - 1);
    BOOL v12 = [(NSString *)v11 isEqual:&stru_1ECA5C228];
    setpwent();
    for (uint64_t i = getpwent(); i; uint64_t i = getpwent())
    {
      NSStringEncoding v14 = +[NSString stringWithUTF8String:i->pw_name];
      uint64_t v15 = v14;
      if (v12 || [(NSString *)v14 hasPrefix:v11]) {
        [v10 addObject:objc_msgSend(@"~", "stringByAppendingString:", v15)];
      }
    }
    endpwent();
    uint64_t v16 = (NSArray *)[v10 allObjects];

    if (outputName) {
      *outputName = (NSString *)_NSFindCommonPrefixInStringArray(v16, v84);
    }
    if (outputArray) {
      *outputArray = v16;
    }
    return [(NSArray *)v16 count];
  }
  if ([(NSString *)self hasSuffix:@"/"] || [(NSString *)self hasSuffix:@"\\""])
  {
    uint64_t v17 = (NSString *)&stru_1ECA5C228;
  }
  else
  {
    uint64_t v17 = [(NSString *)self lastPathComponent];
    self = [(NSString *)self stringByDeletingLastPathComponent];
  }
  if (v84)
  {
    uint64_t v18 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:self];
    uint64_t v19 = 8;
  }
  else
  {
    if ([(NSString *)self isEqual:&stru_1ECA5C228])
    {
      id v20 = (id)[MEMORY[0x1E4F1C978] arrayWithObject:&stru_1ECA5C228];
      if (!v20) {
        return 0;
      }
    }
    else
    {
      v87 = v17;
      v77 = filterTypes;
      uint64_t v21 = [(NSString *)self pathComponents];
      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v119 = 0u;
      long long v120 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      obuint64_t j = v21;
      uint64_t v24 = [(NSArray *)v21 countByEnumeratingWithState:&v119 objects:v123 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v120;
        uint64_t v81 = *(void *)v120;
        do
        {
          uint64_t v27 = 0;
          uint64_t v79 = v25;
          do
          {
            if (*(void *)v120 != v26) {
              objc_enumerationMutation(obj);
            }
            char v28 = *(void **)(*((void *)&v119 + 1) + 8 * v27);
            if ([v28 isEqual:@"/"])
            {
              [v23 addObject:v28];
            }
            else if ([v23 count])
            {
              uint64_t v89 = v27;
              id v92 = v23;
              long long v109 = 0u;
              long long v110 = 0u;
              long long v107 = 0u;
              long long v108 = 0u;
              uint64_t v29 = [v23 countByEnumeratingWithState:&v107 objects:v106 count:16];
              if (v29)
              {
                uint64_t v30 = v29;
                uint64_t v94 = *(void *)v108;
                do
                {
                  for (uint64_t j = 0; j != v30; ++j)
                  {
                    if (*(void *)v108 != v94) {
                      objc_enumerationMutation(v92);
                    }
                    unsigned __int16 v32 = *(void **)(*((void *)&v107 + 1) + 8 * j);
                    unint64_t v33 = [(NSFileManager *)v83 contentsOfDirectoryAtPath:v32 error:0];
                    long long v102 = 0u;
                    long long v103 = 0u;
                    long long v104 = 0u;
                    long long v105 = 0u;
                    uint64_t v34 = [(NSArray *)v33 countByEnumeratingWithState:&v102 objects:v101 count:16];
                    if (v34)
                    {
                      uint64_t v35 = v34;
                      uint64_t v36 = *(void *)v103;
                      do
                      {
                        for (uint64_t k = 0; k != v35; ++k)
                        {
                          if (*(void *)v103 != v36) {
                            objc_enumerationMutation(v33);
                          }
                          uint64_t v38 = *(void **)(*((void *)&v102 + 1) + 8 * k);
                          if (![v38 caseInsensitiveCompare:v28]) {
                            objc_msgSend(v22, "addObject:", objc_msgSend(v32, "stringByAppendingPathComponent:", v38));
                          }
                        }
                        uint64_t v35 = [(NSArray *)v33 countByEnumeratingWithState:&v102 objects:v101 count:16];
                      }
                      while (v35);
                    }
                  }
                  uint64_t v30 = [v92 countByEnumeratingWithState:&v107 objects:v106 count:16];
                }
                while (v30);
              }
              if (![v22 count])
              {

                return 0;
              }
              [v92 removeAllObjects];
              id v23 = v22;
              id v22 = v92;
              uint64_t v25 = v79;
              uint64_t v26 = v81;
              uint64_t v27 = v89;
            }
            else
            {
              uint64_t v39 = v23;
              BOOL v40 = [(NSFileManager *)v83 contentsOfDirectoryAtPath:[(NSFileManager *)v83 currentDirectoryPath] error:0];
              long long v115 = 0u;
              long long v116 = 0u;
              long long v117 = 0u;
              long long v118 = 0u;
              uint64_t v41 = [(NSArray *)v40 countByEnumeratingWithState:&v115 objects:&v111 count:16];
              if (v41)
              {
                uint64_t v42 = v41;
                uint64_t v90 = v27;
                uint64_t v43 = *(void *)v116;
                do
                {
                  for (uint64_t m = 0; m != v42; ++m)
                  {
                    if (*(void *)v116 != v43) {
                      objc_enumerationMutation(v40);
                    }
                    long long v45 = *(void **)(*((void *)&v115 + 1) + 8 * m);
                    if (![v45 caseInsensitiveCompare:v28]) {
                      [v39 addObject:v45];
                    }
                  }
                  uint64_t v42 = [(NSArray *)v40 countByEnumeratingWithState:&v115 objects:&v111 count:16];
                }
                while (v42);
                id v23 = v39;
                uint64_t v27 = v90;
                uint64_t v26 = v81;
              }
              else
              {
                id v23 = v39;
              }
            }
            ++v27;
          }
          while (v27 != v25);
          uint64_t v25 = [(NSArray *)obj countByEnumeratingWithState:&v119 objects:v123 count:16];
        }
        while (v25);
      }

      id v20 = v23;
      filterTypes = v77;
      uint64_t v17 = v87;
      if (!v20) {
        return 0;
      }
    }
    uint64_t v18 = v20;
    uint64_t v19 = 9;
  }
  id obja = (id)v19;
  long long v46 = (NSArray *)[MEMORY[0x1E4F1CA48] array];
  CFRange v74 = 0;
  CFRange v75 = v46;
  while (1)
  {
    long long v99 = 0u;
    long long v100 = 0u;
    long long v97 = 0u;
    long long v98 = 0u;
    id v76 = v18;
    uint64_t v80 = [v18 countByEnumeratingWithState:&v97 objects:v96 count:16];
    if (v80)
    {
      uint64_t v78 = *(void *)v98;
      v88 = v17;
      do
      {
        for (uint64_t n = 0; n != v80; ++n)
        {
          if (*(void *)v98 != v78) {
            objc_enumerationMutation(v76);
          }
          long long v48 = *(NSString **)(*((void *)&v97 + 1) + 8 * n);
          v93 = v48;
          if (![(NSString *)v48 length]) {
            long long v48 = [(NSFileManager *)v83 currentDirectoryPath];
          }
          uint64_t v49 = [(NSFileManager *)v83 contentsOfDirectoryAtPath:v48 error:0];
          if (!v49)
          {
            uint64_t v54 = [MEMORY[0x1E4F1C978] array];
            goto LABEL_108;
          }
          NSRange v50 = v49;
          uint64_t v82 = n;
          uint64_t v51 = [(NSArray *)v49 count];
          uint64_t v91 = [MEMORY[0x1E4F1CA48] array];
          if (v17)
          {
            char v52 = [(NSString *)v17 isEqual:&stru_1ECA5C228];
            if (!filterTypes) {
              goto LABEL_82;
            }
          }
          else
          {
            char v52 = 1;
            if (!filterTypes)
            {
LABEL_82:
              BOOL v53 = 1;
              goto LABEL_83;
            }
          }
          BOOL v53 = [(NSArray *)filterTypes count] == 0;
LABEL_83:
          BOOL v95 = v53;
          if (v51 < 1) {
            goto LABEL_107;
          }
          v55 = filterTypes;
          for (iuint64_t i = 0; ii != v51; ++ii)
          {
            id v57 = [(NSArray *)v50 objectAtIndex:ii];
            uint64_t v58 = v57;
            if ((v52 & 1) != 0 || [v57 rangeOfString:v88 options:obja] != 0x7FFFFFFFFFFFFFFFLL)
            {
              uint64_t v59 = [v58 pathExtension];
              if (v95) {
                goto LABEL_88;
              }
              v62 = (void *)v59;
              if (v84)
              {
                if ([(NSArray *)v55 containsObject:v59]) {
                  goto LABEL_88;
                }
              }
              else
              {
                long long v113 = 0u;
                long long v114 = 0u;
                long long v111 = 0u;
                long long v112 = 0u;
                uint64_t v63 = [(NSArray *)v55 countByEnumeratingWithState:&v111 objects:v123 count:16];
                if (v63)
                {
                  uint64_t v64 = v63;
                  uint64_t v65 = *(void *)v112;
LABEL_97:
                  uint64_t v66 = 0;
                  while (1)
                  {
                    if (*(void *)v112 != v65) {
                      objc_enumerationMutation(v55);
                    }
                    if (![*(id *)(*((void *)&v111 + 1) + 8 * v66) caseInsensitiveCompare:v62]) {
                      break;
                    }
                    if (v64 == ++v66)
                    {
                      uint64_t v64 = [(NSArray *)v55 countByEnumeratingWithState:&v111 objects:v123 count:16];
                      if (v64) {
                        goto LABEL_97;
                      }
                      goto LABEL_103;
                    }
                  }
LABEL_88:
                  uint64_t v60 = [(NSString *)v93 stringByAppendingPathComponent:v58];
                  unint64_t v61 = (void *)v91;
LABEL_89:
                  [v61 addObject:v60];
                  continue;
                }
              }
LABEL_103:
              if ([v62 isEqual:&stru_1ECA5C228])
              {
                v106[0] = 0;
                uint64_t v67 = [(NSString *)v93 stringByAppendingPathComponent:v58];
                if ([(NSFileManager *)v83 fileExistsAtPath:v67 isDirectory:v106])
                {
                  if (v106[0])
                  {
                    unint64_t v61 = (void *)v91;
                    uint64_t v60 = v67;
                    goto LABEL_89;
                  }
                }
              }
            }
          }
          filterTypes = v55;
          uint64_t v17 = v88;
          long long v46 = v75;
LABEL_107:
          uint64_t n = v82;
          uint64_t v54 = v91;
LABEL_108:
          [(NSArray *)v46 addObjectsFromArray:v54];
        }
        uint64_t v80 = [v76 countByEnumeratingWithState:&v97 objects:v96 count:16];
      }
      while (v80);
    }
    unint64_t v68 = [(NSArray *)v46 count];
    NSUInteger v8 = v68;
    v123[0] = 0;
    BOOL v69 = v74;
    if (!v74 && !v68) {
      return v8;
    }
    if (v68 >= 2) {
      break;
    }
    if (v68 != 1
      || (BOOL v69 = [(NSArray *)v46 objectAtIndex:0],
          [(NSFileManager *)v83 fileExistsAtPath:v69 isDirectory:v123])
      && !v123[0])
    {
      if (outputName) {
        *outputName = v69;
      }
      if (outputArray)
      {
        uint64_t v70 = [MEMORY[0x1E4F1C978] arrayWithObject:v69];
        v71 = outputArray;
        long long v46 = (NSArray *)v70;
        NSUInteger v8 = 1;
        goto LABEL_124;
      }
      return 1;
    }
    CFRange v74 = v69;
    uint64_t v18 = (void *)[MEMORY[0x1E4F1C978] arrayWithObject:v69];
    [(NSArray *)v46 removeAllObjects];
    uint64_t v17 = (NSString *)&stru_1ECA5C228;
  }
  if (outputName) {
    *outputName = (NSString *)_NSFindCommonPrefixInStringArray(v46, v84);
  }
  v71 = outputArray;
  if (outputArray) {
LABEL_124:
  }
    _OWORD *v71 = v46;
  return v8;
}

- (id)stringByConvertingPathToURL
{
  unint64_t v2 = [(NSString *)self stringByStandardizingPath];

  return (id)[@"file://localhost" stringByAppendingString:v2];
}

- (id)stringByConvertingURLToPath
{
  unint64_t v2 = self;
  if (![(NSString *)self hasPrefix:@"file:"])
  {
    if ([(NSString *)v2 rangeOfString:@":"] != 0x7FFFFFFFFFFFFFFFLL) {
      return 0;
    }
    goto LABEL_8;
  }
  if (![[(NSString *)v2 substringFromIndex:5] hasPrefix:@"//"])return 0; {
  uint64_t v3 = [(NSString *)v2 substringFromIndex:2];
  }
  if (!v3) {
    return 0;
  }
  unint64_t v4 = v3;
  if ([(NSString *)v3 characterAtIndex:0] != 47)
  {
    if (![(NSString *)v4 hasPrefix:@"localhost"]) {
      return 0;
    }
    unint64_t v2 = [(NSString *)v2 substringFromIndex:9];
LABEL_8:
    unint64_t v4 = v2;
    if (v2) {
      goto LABEL_9;
    }
    return 0;
  }
LABEL_9:

  return [(NSString *)v4 stringByStandardizingPath];
}

+ (id)_newZStringWithCharacters:(const unsigned __int16 *)a3 length:(unint64_t)a4
{
  uint64_t v6 = [_NSClStr alloc];

  return [(_NSClStr *)v6 initWithCharacters:a3 length:a4];
}

+ (id)_newZStringWithString:(id)a3
{
  unint64_t v4 = [_NSClStr alloc];

  return [(_NSClStr *)v4 initWithString:a3];
}

+ (id)_newZStringWithUTF8String:(const char *)a3
{
  unint64_t v4 = [_NSClStr alloc];

  return [(_NSClStr *)v4 initWithUTF8String:a3];
}

+ (NSStringEncoding)stringEncodingForData:(NSData *)data encodingOptions:(NSDictionary *)opts convertedString:(NSString *)string usedLossyConversion:(BOOL *)usedLossyConversion
{
  uint64_t v301 = *MEMORY[0x1E4F143B8];
  if (!opts)
  {
    unint64_t v248 = 0;
    id v13 = 0;
    NSStringEncoding v14 = 0;
    v236 = 0;
    unsigned int v252 = 0;
    BOOL v238 = 0;
    int v240 = 0;
    int v242 = 1;
    BOOL v243 = 0;
    __int16 v11 = @"\uFFFD";
    goto LABEL_29;
  }
  uint64_t v10 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionLossySubstitutionKey"];
  if (v10)
  {
    __int16 v11 = v10;
    if ((_NSIsNSString() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLossySubstitutionKey must be an object of NSString.";
      goto LABEL_459;
    }
  }
  else
  {
    __int16 v11 = @"\uFFFD";
  }
  id v15 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionAllowLossyKey"];
  if (v15)
  {
    uint64_t v16 = v15;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionAllowLossyKey must be an object of NSNumber.";
      goto LABEL_459;
    }
    int v17 = [v16 BOOLValue];
  }
  else
  {
    int v17 = 1;
  }
  id v18 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionSuggestedEncodingsKey"];
  if (v18)
  {
    if ((_NSIsNSArray() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionSuggestedEncodingsKey must be an object of NSArray.";
      goto LABEL_459;
    }
    uint64_t v19 = v18;
    unint64_t v248 = [v18 count];
    BOOL v243 = v248 != 0;
  }
  else
  {
    uint64_t v19 = 0;
    BOOL v243 = 0;
    unint64_t v248 = 0;
  }
  id v20 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionUseOnlySuggestedEncodingsKey"];
  int v242 = v17;
  if (!v20) {
    goto LABEL_20;
  }
  uint64_t v21 = v20;
  if ((_NSIsNSNumber() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionUseOnlySuggestedEncodingsKey must be an object of NSNumber.";
    goto LABEL_459;
  }
  if ([v21 BOOLValue])
  {
    NSStringEncoding v14 = v19;
    unsigned int v252 = 1;
    if ((unint64_t)[v19 count] < 2)
    {
      id v13 = 0;
      v236 = 0;
      BOOL v238 = 0;
      int v240 = 0;
      goto LABEL_29;
    }
  }
  else
  {
LABEL_20:
    unsigned int v252 = 0;
    NSStringEncoding v14 = v19;
  }
  id v22 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionFromWindowsKey"];
  BOOL v23 = v22 != 0;
  if (v22)
  {
    uint64_t v24 = v22;
    if ((_NSIsNSNumber() & 1) == 0)
    {
      BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionFromWindowsKey must be an object of NSNumber.";
      goto LABEL_459;
    }
    int v240 = [v24 BOOLValue];
  }
  else
  {
    int v240 = 0;
  }
  BOOL v238 = v23;
  id v25 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionLikelyLanguageKey"];
  if (v25 && (_NSIsNSString() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionLikelyLanguageKey must be an object of NSString.";
    goto LABEL_459;
  }
  v236 = v25;
  id v13 = [(NSDictionary *)opts objectForKey:@"NSStringEncodingDetectionDisallowedEncodingsKey"];
  if (v13 && (_NSIsNSArray() & 1) == 0)
  {
    BOOL v12 = @"[NSString stringEncodingForData:encodingOptions:lossyDone:]: The value for NSStringEncodingDetectionDisallowedEncodingsKey must be an object of NSArray.";
LABEL_459:
    v229 = +[NSString stringWithFormat:v12];
    objc_exception_throw((id)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8] reason:v229 userInfo:0]);
  }
LABEL_29:
  if (!data) {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  if (![(NSData *)data length])
  {
    if (v243)
    {
      NSStringEncoding v28 = objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "integerValue");
      if (!string)
      {
LABEL_65:
        if (usedLossyConversion) {
          *usedLossyConversiouint64_t n = 0;
        }
        return v28;
      }
    }
    else
    {
      NSStringEncoding v28 = 4;
      if (!string) {
        goto LABEL_65;
      }
    }
    *string = (NSString *)&stru_1ECA5C228;
    goto LABEL_65;
  }
  if (qword_1EB1ED780 != -1) {
    dispatch_once(&qword_1EB1ED780, &__block_literal_global_41);
  }
  unint64_t v26 = v248;
  if (qword_1EB1ED788 != -1)
  {
    dispatch_once(&qword_1EB1ED788, &__block_literal_global_230);
    unint64_t v26 = v248;
  }
  if (v26 == 1) {
    unsigned int v27 = v252;
  }
  else {
    unsigned int v27 = 0;
  }
  if (v27 == 1)
  {
    LOBYTE(iterations) = 0;
    NSStringEncoding v28 = objc_msgSend((id)objc_msgSend(v14, "objectAtIndex:", 0), "integerValue");
    if (string)
    {
      StringWithEncoding = [[NSString alloc] initWithData:data encoding:v28];
      if (!StringWithEncoding)
      {
        StringWithEncoding = +[NSEncodingDetector detectorForCFStringEncoding:CFStringConvertNSStringEncodingToEncoding(v28) allowBackupDetectors:1];
        if (StringWithEncoding)
        {
          uint64_t v30 = StringWithEncoding;
          uint64_t v31 = [(NSData *)data bytes];
          unsigned __int16 v32 = data;
          uint64_t v33 = (uint64_t)v31;
          uint64_t v34 = [(NSData *)v32 length];
          [(NSString *)v30 recognizeString:v33 withDataLength:v34 intoBuffer:0];
          StringWithEncoding = (NSString *)generateStringWithEncoding(v30, v33, v34, 0, v242, (uint64_t)v11, (BOOL *)&iterations);
        }
      }
      *string = StringWithEncoding;
      if (usedLossyConversion) {
        *usedLossyConversiouint64_t n = iterations;
      }
    }
    return v28;
  }
  v250 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:_MergedGlobals_117];
  obuint64_t j = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v245 = data;
  v234 = usedLossyConversion;
  v235 = string;
  uint64_t v233 = (uint64_t)v11;
  if (v14)
  {
    long long v300 = 0u;
    long long v299 = 0u;
    long long v298 = 0u;
    long long v297 = 0u;
    uint64_t v35 = [v14 countByEnumeratingWithState:&v297 objects:v296 count:16];
    if (v35)
    {
      uint64_t v36 = v35;
      int v246 = 0;
      uint64_t v37 = *(void *)v298;
      unint64_t v38 = v248;
      do
      {
        uint64_t v39 = v14;
        for (uint64_t i = 0; i != v36; ++i)
        {
          if (*(void *)v298 != v37) {
            objc_enumerationMutation(v39);
          }
          uint64_t v41 = *(void **)(*((void *)&v297 + 1) + 8 * i);
          NSStringEncoding v28 = [v41 integerValue];
          uint64_t v42 = CFStringConvertNSStringEncodingToEncoding(v28);
          uint64_t v43 = +[NSEncodingDetector detectorForCFStringEncoding:v42 allowBackupDetectors:v252];
          if (v43)
          {
            uint64_t v44 = (double *)v43;
            objc_msgSend(v250, "setObject:forKey:", v43, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v42));
            *((_DWORD *)v44 + 41) = v38--;
            v44[19] = v44[19] * 10.0;
          }
          else if (v248 < 2 || v38 == v248)
          {
            long long v45 = [[NSString alloc] initWithData:v245 encoding:v28];
            if (v45)
            {
              if (v235) {
                *v235 = v45;
              }
              if (v234) {
                BOOL *v234 = 0;
              }
              return v28;
            }
          }
          else
          {
            [obj addObject:v41];
            int v246 = 1;
          }
        }
        NSStringEncoding v14 = v39;
        uint64_t v36 = [v39 countByEnumeratingWithState:&v297 objects:v296 count:16];
      }
      while (v36);
    }
    else
    {
      int v246 = 0;
    }
    int v46 = v246;
    usedLossyConversiouint64_t n = v234;
    string = v235;
    __int16 v11 = (__CFString *)v233;
    data = v245;
  }
  else
  {
    int v46 = 0;
  }
  if (v252)
  {
    if ([v250 count])
    {
      int v232 = v46;
LABEL_90:
      uint64_t v49 = 0;
      goto LABEL_98;
    }
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  int v232 = v46;
  if ([v13 count])
  {
    long long v48 = v14;
    uint64_t v49 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:_MergedGlobals_117];
    long long v292 = 0u;
    long long v293 = 0u;
    long long v294 = 0u;
    long long v295 = 0u;
    uint64_t v50 = [v13 countByEnumeratingWithState:&v292 objects:v291 count:16];
    if (v50)
    {
      uint64_t v51 = v50;
      uint64_t v52 = *(void *)v293;
      uint64_t v53 = MEMORY[0x1E4F1CC38];
      do
      {
        for (uint64_t j = 0; j != v51; ++j)
        {
          if (*(void *)v293 != v52) {
            objc_enumerationMutation(v13);
          }
          objc_msgSend(v49, "setObject:forKey:", v53, +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", CFStringConvertNSStringEncodingToEncoding(objc_msgSend(*(id *)(*((void *)&v292 + 1) + 8 * j), "integerValue"))));
        }
        uint64_t v51 = [v13 countByEnumeratingWithState:&v292 objects:v291 count:16];
      }
      while (v51);
    }
    if ((!v238 | v240))
    {
      string = v235;
      __int16 v11 = (__CFString *)v233;
      data = v245;
      NSStringEncoding v14 = v48;
      goto LABEL_98;
    }
    string = v235;
    NSStringEncoding v14 = v48;
    if (v49) {
      goto LABEL_93;
    }
  }
  else if ((!v238 | v240))
  {
    goto LABEL_90;
  }
  uint64_t v49 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithSharedKeySet:_MergedGlobals_117];
LABEL_93:
  v55 = v14;
  uint64_t v56 = 0;
  uint64_t v57 = MEMORY[0x1E4F1CC38];
  do
  {
    uint64_t v58 = +[NSNumber numberWithUnsignedInt:windowsEncodings[v56]];
    if (![v250 objectForKey:v58]) {
      [v49 setObject:v57 forKey:v58];
    }
    ++v56;
  }
  while (v56 != 14);
  __int16 v11 = (__CFString *)v233;
  data = v245;
  NSStringEncoding v14 = v55;
LABEL_98:
  BOOL v260 = 0;
  uint64_t v59 = [(NSData *)data bytes];
  uint64_t v60 = [(NSData *)data length];
  unint64_t v61 = objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 1536));
  if (v61)
  {
    v62 = v61;
    if ([v61 recognizeString:v59 withDataLength:v60 intoBuffer:0] && !v62[8])
    {
      [v62 softReset];
      if (string)
      {
        *string = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v60, [v62 nsEncoding]);
        if (usedLossyConversion) {
          *usedLossyConversiouint64_t n = v260;
        }
      }
      return 1;
    }
    [v62 softReset];
  }
  uint64_t v63 = +[NSNumber numberWithUnsignedInt:67109120];
  if (![v49 objectForKey:v63])
  {
    uint64_t v64 = objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 67109120));
    if (v64) {
      char v65 = 1;
    }
    else {
      char v65 = v252;
    }
    if ((v65 & 1) == 0)
    {
      uint64_t v64 = +[NSEncodingDetector detectorForCFStringEncoding:67109120 allowBackupDetectors:0];
      [v250 setObject:v64 forKey:v63];
    }
    if (v64)
    {
      if ([v64 recognizeString:v59 withDataLength:v60 intoBuffer:0])
      {
        if (*((unsigned char *)v64 + 160))
        {
          if (!v64[8] || *((_DWORD *)v64 + 41) && ([v64 bytesRatio], v66 >= 0.99))
          {
            uint64_t v67 = checkSuggestedEncodings((uint64_t)v59, v60, v250);
            unint64_t v68 = v67 ? (void *)v67 : v64;
            if (generateStringWithEncoding(v68, (uint64_t)v59, v60, 1, 0, 0, 0))
            {
              if (string)
              {
                *string = (NSString *)generateStringWithEncoding(v68, (uint64_t)v59, v60, 1, v242, (uint64_t)v11, &v260);
                if (usedLossyConversion) {
                  *usedLossyConversiouint64_t n = v260;
                }
              }
              BOOL v69 = v68;
              return [v69 nsEncoding];
            }
          }
        }
      }
      [v250 removeObjectForKey:&off_1ECAB50C0];
    }
  }
  uint64_t v70 = +[NSNumber numberWithUnsignedInt:134217984];
  uint64_t v247 = v60;
  if ([v49 objectForKey:v70])
  {
    v71 = 0;
LABEL_125:
    char v72 = v250;
    goto LABEL_126;
  }
  v71 = (_DWORD *)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 134217984));
  if (v71) {
    char v75 = 1;
  }
  else {
    char v75 = v252;
  }
  if ((v75 & 1) == 0)
  {
    v71 = +[NSEncodingDetector detectorForCFStringEncoding:134217984 allowBackupDetectors:0];
    [v250 setObject:v71 forKey:v70];
  }
  if (!v71) {
    goto LABEL_125;
  }
  if ([v71 recognizeString:v59 withDataLength:v60 intoBuffer:0]
    && ([v71 bytesRatio], v76 >= 0.85)
    && ([v71 multiBytesRatio], v77 > 0.0)
    && (*((unsigned char *)v71 + 162) || !*((void *)v71 + 8) || ([v71 multiBytesRatio], v78 >= 0.7))
    || v71[41]
    && (*((unsigned char *)v71 + 162)
     || ([v71 bytesRatio], v79 >= 0.99)
     || ([v71 multiBytesRatio], v80 > 0.7)))
  {
    if (v71[41]) {
      BOOL v81 = v248 != v71[41];
    }
    else {
      BOOL v81 = v243;
    }
    if (!v81)
    {
      if (string)
      {
        *string = (NSString *)generateStringWithEncoding(v71, (uint64_t)v59, v60, 1, v242, (uint64_t)v11, &v260);
        if (usedLossyConversion) {
          *usedLossyConversiouint64_t n = v260;
        }
      }
      return 4;
    }
    goto LABEL_125;
  }
  char v72 = v250;
  [v250 removeObjectForKey:&off_1ECAB50D8];
  v71 = 0;
LABEL_126:
  uint64_t v73 = +[NSNumber numberWithUnsignedInt:256];
  if ([v49 objectForKey:v73])
  {
    id v74 = 0;
  }
  else
  {
    id v74 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 256));
    if (v74) {
      char v82 = 1;
    }
    else {
      char v82 = v252;
    }
    if ((v82 & 1) == 0)
    {
      id v74 = +[NSEncodingDetector detectorForCFStringEncoding:256 allowBackupDetectors:0];
      [v72 setObject:v74 forKey:v73];
    }
  }
  v239 = v71;
  v83 = +[NSNumber numberWithUnsignedInt:268435712];
  if ([v49 objectForKey:v83])
  {
    id v84 = 0;
  }
  else
  {
    id v84 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 268435712));
    if (v84) {
      char v85 = 1;
    }
    else {
      char v85 = v252;
    }
    if ((v85 & 1) == 0)
    {
      id v84 = +[NSEncodingDetector detectorForCFStringEncoding:268435712 allowBackupDetectors:0];
      [v72 setObject:v84 forKey:v83];
    }
  }
  v86 = +[NSNumber numberWithUnsignedInt:335544576];
  if ([v49 objectForKey:v86])
  {
    id v87 = 0;
  }
  else
  {
    id v87 = (id)objc_msgSend(v72, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 335544576));
    char v88 = v252;
    if (v87) {
      char v88 = 1;
    }
    if ((v88 & 1) == 0)
    {
      id v87 = +[NSEncodingDetector detectorForCFStringEncoding:335544576 allowBackupDetectors:0];
      [v72 setObject:v87 forKey:v86];
    }
  }
  uint64_t v89 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:3];
  uint64_t v90 = v89;
  if (v74) {
    [v89 addObject:v74];
  }
  if (v84) {
    [v90 addObject:v84];
  }
  v249 = v14;
  if (v87) {
    [v90 addObject:v87];
  }
  long long v289 = 0u;
  long long v290 = 0u;
  long long v287 = 0u;
  long long v288 = 0u;
  uint64_t v91 = [v90 countByEnumeratingWithState:&v287 objects:v286 count:16];
  if (!v91)
  {
LABEL_189:
    long long v284 = 0u;
    long long v285 = 0u;
    long long v282 = 0u;
    long long v283 = 0u;
    uint64_t v97 = [v90 countByEnumeratingWithState:&v282 objects:v281 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v283;
      do
      {
        for (uint64_t k = 0; k != v98; ++k)
        {
          if (*(void *)v283 != v99) {
            objc_enumerationMutation(v90);
          }
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(*((void *)&v282 + 1) + 8 * k) + 24)));
        }
        uint64_t v98 = [v90 countByEnumeratingWithState:&v282 objects:v281 count:16];
      }
      while (v98);
    }
    v101 = +[NSNumber numberWithUnsignedInt:201326848];
    if ([v49 objectForKey:v101])
    {
      id v102 = 0;
    }
    else
    {
      id v102 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 201326848));
      if (v102) {
        char v103 = 1;
      }
      else {
        char v103 = v252;
      }
      if ((v103 & 1) == 0)
      {
        id v102 = +[NSEncodingDetector detectorForCFStringEncoding:201326848 allowBackupDetectors:0];
        [v250 setObject:v102 forKey:v101];
      }
    }
    long long v104 = +[NSNumber numberWithUnsignedInt:402653440];
    if ([v49 objectForKey:v104])
    {
      id v105 = 0;
    }
    else
    {
      id v105 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 402653440));
      if (v105) {
        char v106 = 1;
      }
      else {
        char v106 = v252;
      }
      if ((v106 & 1) == 0)
      {
        id v105 = +[NSEncodingDetector detectorForCFStringEncoding:402653440 allowBackupDetectors:0];
        [v250 setObject:v105 forKey:v104];
      }
    }
    long long v107 = +[NSNumber numberWithUnsignedInt:469762304];
    if ([v49 objectForKey:v107])
    {
      id v108 = 0;
    }
    else
    {
      id v108 = (id)objc_msgSend(v250, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", 469762304));
      if (v108) {
        char v109 = 1;
      }
      else {
        char v109 = v252;
      }
      if ((v109 & 1) == 0)
      {
        id v108 = +[NSEncodingDetector detectorForCFStringEncoding:469762304 allowBackupDetectors:0];
        [v250 setObject:v108 forKey:v107];
      }
    }
    [v90 removeAllObjects];
    if (v102) {
      [v90 addObject:v102];
    }
    if (v105) {
      [v90 addObject:v105];
    }
    if (v108) {
      [v90 addObject:v108];
    }
    long long v279 = 0u;
    long long v280 = 0u;
    long long v277 = 0u;
    long long v278 = 0u;
    uint64_t v110 = [v90 countByEnumeratingWithState:&v277 objects:v276 count:16];
    if (v110)
    {
      uint64_t v111 = v110;
      uint64_t v112 = *(void *)v278;
LABEL_232:
      uint64_t v113 = 0;
      while (1)
      {
        if (*(void *)v278 != v112) {
          objc_enumerationMutation(v90);
        }
        uint64_t v95 = *(void *)(*((void *)&v277 + 1) + 8 * v113);
        if ([(id)v95 recognizeString:v59 withDataLength:v247 intoBuffer:0])
        {
          [(id)v95 bytesRatio];
          if (v114 >= 0.85)
          {
            if (*(unsigned char *)(v95 + 162)) {
              break;
            }
            [(id)v95 bytesRatio];
            if (v115 >= 0.99) {
              break;
            }
          }
        }
        if (v111 == ++v113)
        {
          uint64_t v111 = [v90 countByEnumeratingWithState:&v277 objects:v276 count:16];
          if (!v111) {
            goto LABEL_241;
          }
          goto LABEL_232;
        }
      }
      if (v235)
      {
        *v235 = (NSString *)generateStringWithEncoding((void *)v95, (uint64_t)v59, v247, 1, v242, v233, &v260);
        if (v234) {
          BOOL *v234 = v260;
        }
      }
      goto LABEL_268;
    }
LABEL_241:
    long long v274 = 0u;
    long long v275 = 0u;
    long long v272 = 0u;
    long long v273 = 0u;
    uint64_t v116 = [v90 countByEnumeratingWithState:&v272 objects:v271 count:16];
    long long v117 = v250;
    if (v116)
    {
      uint64_t v118 = v116;
      uint64_t v119 = *(void *)v273;
      do
      {
        for (uint64_t m = 0; m != v118; ++m)
        {
          if (*(void *)v273 != v119) {
            objc_enumerationMutation(v90);
          }
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(*(void *)(*((void *)&v272 + 1) + 8 * m) + 24)));
        }
        uint64_t v118 = [v90 countByEnumeratingWithState:&v272 objects:v271 count:16];
      }
      while (v118);
    }
    long long v121 = malloc_type_malloc(0x30uLL, 0x80040B8603338uLL);
    size_t iterations = 0;
    getAllDetectors((uint64_t)v121, &iterations, codeSchemeEncodings, 6, v250, v49, v252);
    size_t v122 = iterations;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke;
    block[3] = &__block_descriptor_56_e8_v16__0Q8l;
    block[4] = v121;
    block[5] = v59;
    block[6] = v247;
    dispatch_apply(iterations, 0, block);
    if (v122)
    {
      uint64_t v123 = 0;
      uint64_t v124 = 0;
      unint64_t v125 = -1;
      double v126 = 0.0;
      unint64_t v127 = 1;
      do
      {
        v128 = (void *)v121[v123];
        [v128 confidence];
        if (v128[5])
        {
          double v130 = v129;
          [v128 bytesRatio];
          if (v131 >= 0.85 && (v130 > v126 || v130 == v126 && v125 > v128[8]) && v128[15] >= v127)
          {
            unint64_t v125 = v128[8];
            uint64_t v124 = v128;
            unint64_t v127 = v128[15];
            double v126 = v130;
          }
        }
        ++v123;
      }
      while (v122 != v123);
      long long v117 = v250;
      if (v124)
      {
        if (!v235)
        {
LABEL_262:
          if (v234) {
            BOOL *v234 = v260;
          }
          free(v121);
          BOOL v69 = v124;
          return [v69 nsEncoding];
        }
        uint64_t v132 = generateStringWithEncoding(v124, (uint64_t)v59, v247, 1, v242, v233, &v260);
        if (v132)
        {
          *v235 = (NSString *)v132;
          goto LABEL_262;
        }
        size_t v122 = iterations;
      }
      if (v122)
      {
        v134 = v121;
        do
        {
          uint64_t v135 = *v134++;
          objc_msgSend(v250, "removeObjectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", *(unsigned int *)(v135 + 24)));
          --v122;
        }
        while (v122);
      }
    }
    free(v121);
    v136 = malloc_type_malloc(0xD0uLL, 0x80040B8603338uLL);
    v137 = malloc_type_malloc(0x70uLL, 0x80040B8603338uLL);
    size_t v256 = 0;
    size_t __nel = 0;
    getAllDetectors((uint64_t)v136, &__nel, singleByteEncodings, 26, v117, v49, v252);
    getAllDetectors((uint64_t)v137, &v256, multiByteEncodings, 14, v117, v49, v252);
    if (v240)
    {
      for (uint64_t n = 0; n != 14; ++n)
      {
        uint64_t v139 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", windowsEncodings[n]));
        if (v139) {
          *(double *)(v139 + 152) = *(double *)(v139 + 152) * 5.0;
        }
      }
    }
    v230 = v137;
    v231 = v136;
    if (v236)
    {
      if ([v236 hasPrefix:@"zh"])
      {
        for (iuint64_t i = 0; ii != 11; ++ii)
        {
          uint64_t v141 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", chineseEncodings[ii]));
          if (v141) {
            *(double *)(v141 + 152) = *(double *)(v141 + 152) * 5.0;
          }
        }
      }
      else if ([v236 hasPrefix:@"ja"])
      {
        for (juint64_t j = 0; jj != 6; ++jj)
        {
          uint64_t v143 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", japaneseEncodings[jj]));
          if (v143) {
            *(double *)(v143 + 152) = *(double *)(v143 + 152) * 5.0;
          }
        }
      }
      else if ([v236 hasPrefix:@"ko"])
      {
        for (kuint64_t k = 0; kk != 3; ++kk)
        {
          uint64_t v145 = objc_msgSend(v117, "objectForKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", koreanEncodings[kk]));
          if (v145) {
            *(double *)(v145 + 152) = *(double *)(v145 + 152) * 5.0;
          }
        }
      }
      else
      {
        v146 = objc_msgSend(&unk_1ECAB8750, "objectForKey:", objc_msgSend(v236, "substringWithRange:", 0, 2));
        uint64_t v147 = [v146 count];
        if (v147)
        {
          uint64_t v148 = v147;
          v149 = (unsigned int *)malloc_type_malloc(4 * v147, 0x100004052888210uLL);
          long long v267 = 0u;
          long long v268 = 0u;
          long long v269 = 0u;
          long long v270 = 0u;
          uint64_t v150 = [v146 countByEnumeratingWithState:&v267 objects:v266 count:16];
          if (v150)
          {
            uint64_t v151 = v150;
            uint64_t v152 = 0;
            uint64_t v153 = *(void *)v268;
            do
            {
              for (muint64_t m = 0; mm != v151; ++mm)
              {
                if (*(void *)v268 != v153) {
                  objc_enumerationMutation(v146);
                }
                v149[v152 + mm] = [*(id *)(*((void *)&v267 + 1) + 8 * mm) integerValue];
              }
              uint64_t v151 = [v146 countByEnumeratingWithState:&v267 objects:v266 count:16];
              v152 += mm;
            }
            while (v151);
          }
          increaseWeightsOfEncodings((uint64_t)v250, v149, v148);
          free(v149);
          v137 = v230;
          v136 = v231;
        }
      }
    }
    if (v249)
    {
      mergesort(v136, __nel, 8uLL, (int (__cdecl *)(const void *, const void *))compareTwoDetectors);
      size_t v155 = v256;
      mergesort(v137, v256, 8uLL, (int (__cdecl *)(const void *, const void *))compareTwoDetectors);
    }
    else
    {
      size_t v155 = v256;
    }
    v255[0] = MEMORY[0x1E4F143A8];
    v255[1] = 3221225472;
    v255[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_2;
    v255[3] = &__block_descriptor_56_e8_v16__0Q8l;
    v255[4] = v137;
    v255[5] = v59;
    v255[6] = v247;
    dispatch_apply(v155, 0, v255);
    if (v155)
    {
      v253 = 0;
      id v156 = 0;
      double v157 = 0.0;
      unint64_t v158 = -1;
      v159 = (id *)v137;
      unint64_t v160 = -1;
      double v161 = 0.0;
      while (1)
      {
        v162 = *v159;
        [*v159 confidence];
        double v164 = v163;
        unint64_t v165 = v162[8];
        [v162 bytesRatio];
        double v167 = v166;
        if ((v164 > v161 || (v164 == v161 ? (BOOL v168 = v160 >= v165) : (BOOL v168 = 0), v168)) && v166 >= 0.85)
        {
          if (v162[8])
          {
            double v169 = v164;
            uint64_t v170 = v165;
            id v171 = v162;
          }
          else
          {
            v176 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, [v162 nsEncoding]);
            double v169 = v164;
            uint64_t v170 = v165;
            id v171 = v162;
            if (!v176)
            {
              double v169 = v161;
              uint64_t v170 = v160;
              id v171 = v156;
              goto LABEL_336;
            }
          }
        }
        else
        {
          double v169 = v161;
          uint64_t v170 = v160;
          id v171 = v156;
        }
        double v172 = v164 / *((double *)v162 + 19);
        if ((v172 > v157 || (v172 == v157 ? (BOOL v173 = v158 >= v165) : (BOOL v173 = 0), v173)) && v167 >= 0.85)
        {
          if (!v162[8])
          {
            uint64_t v174 = v170;
            v175 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, [v162 nsEncoding]);
            uint64_t v170 = v174;
            if (!v175) {
              goto LABEL_336;
            }
          }
        }
        else
        {
          double v172 = v157;
          unint64_t v165 = v158;
          v162 = v253;
        }
        double v157 = v172;
        unint64_t v158 = v165;
        v253 = v162;
LABEL_336:
        ++v159;
        id v156 = v171;
        unint64_t v160 = v170;
        double v161 = v169;
        if (!--v155) {
          goto LABEL_341;
        }
      }
    }
    id v171 = 0;
    v253 = 0;
    uint64_t v170 = -1;
    double v169 = 0.0;
LABEL_341:
    unint64_t v177 = v170;
    v251 = v171;
    size_t v178 = __nel;
    v254[0] = MEMORY[0x1E4F143A8];
    v254[1] = 3221225472;
    v254[2] = __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_3;
    v254[3] = &__block_descriptor_56_e8_v16__0Q8l;
    v179 = (id *)v231;
    v254[4] = v231;
    v254[5] = v59;
    v254[6] = v247;
    dispatch_apply(__nel, 0, v254);
    v180 = 0;
    if (v178)
    {
      char v241 = 1;
      double v181 = 0.0;
      unint64_t v182 = -1;
      while (1)
      {
        v183 = *v179;
        [*v179 confidence];
        double v185 = v184;
        unint64_t v186 = v183[8];
        [v183 bytesRatio];
        double v188 = v187;
        if (v185 <= v169)
        {
          unint64_t v189 = v177;
          BOOL v190 = v185 == v169 && v177 >= v186;
          if (!v190 || v187 < 0.85) {
            goto LABEL_358;
          }
        }
        else
        {
          unint64_t v189 = v177;
          if (v187 < 0.85) {
            goto LABEL_358;
          }
        }
        unint64_t v191 = v183[8];
        if (*((_DWORD *)v183 + 6) == 1536 && (double)v191 / (double)(unint64_t)v183[4] > 0.005) {
          goto LABEL_372;
        }
        if (v191)
        {
          char v241 = 0;
          double v169 = v185;
          unint64_t v189 = v186;
          v251 = v183;
        }
        else
        {
          if (!-[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, [v183 nsEncoding]))
          {
            unint64_t v189 = v177;
            goto LABEL_372;
          }
          char v241 = 0;
          double v169 = v185;
          unint64_t v189 = v186;
          v251 = v183;
        }
LABEL_358:
        double v192 = v185 / *((double *)v183 + 19);
        if ((v192 > v181 || (v192 == v181 ? (BOOL v193 = v182 >= v186) : (BOOL v193 = 0), v193)) && v188 >= 0.85)
        {
          unint64_t v194 = v183[8];
          if (*((_DWORD *)v183 + 6) == 1536 && (double)v194 / (double)(unint64_t)v183[4] > 0.005) {
            goto LABEL_372;
          }
          if (!v194)
          {
            unint64_t v195 = v189;
            uint64_t v196 = generateStringWithEncoding(v183, (uint64_t)v59, v247, 1, 0, 0, 0);
            unint64_t v189 = v195;
            if (!v196) {
              goto LABEL_372;
            }
          }
        }
        else
        {
          double v192 = v181;
          unint64_t v186 = v182;
          v183 = v180;
        }
        double v181 = v192;
        unint64_t v182 = v186;
        v180 = v183;
LABEL_372:
        unint64_t v177 = v189;
        ++v179;
        if (!--v178) {
          goto LABEL_376;
        }
      }
    }
    char v241 = 1;
LABEL_376:
    char v197 = v241;
    NSStringEncoding v28 = (NSStringEncoding)v251;
    if (v251) {
      uint64_t v198 = [v251 nsEncoding];
    }
    else {
      uint64_t v198 = 0x7FFFFFFFFFFFFFFFLL;
    }
    uint64_t v199 = v233;
    v200 = v239;
    if (v169 >= 0.05
      || (objc_msgSend(v249, "containsObject:", +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v198)) & 1) != 0)
    {
      int v201 = v242;
      NSStringEncoding v202 = (NSStringEncoding)v253;
    }
    else
    {
      int v201 = v242;
      v237 = v180;
      if (v232)
      {
        long long v264 = 0u;
        long long v265 = 0u;
        long long v262 = 0u;
        long long v263 = 0u;
        uint64_t v214 = [obj countByEnumeratingWithState:&v262 objects:v261 count:16];
        if (v214)
        {
          uint64_t v215 = v214;
          uint64_t v216 = *(void *)v263;
          while (2)
          {
            for (nuint64_t n = 0; nn != v215; ++nn)
            {
              if (*(void *)v263 != v216) {
                objc_enumerationMutation(obj);
              }
              v218 = *(void **)(*((void *)&v262 + 1) + 8 * nn);
              v219 = -[NSString initWithData:encoding:]([NSString alloc], "initWithData:encoding:", v245, [v218 integerValue]);
              if (v219)
              {
                if (v235) {
                  *v235 = v219;
                }
                if (v234) {
                  BOOL *v234 = 0;
                }
                free(v230);
                free(v231);
                return [v218 integerValue];
              }
            }
            uint64_t v215 = [obj countByEnumeratingWithState:&v262 objects:v261 count:16];
            uint64_t v199 = v233;
            NSStringEncoding v28 = (NSStringEncoding)v251;
            if (v215) {
              continue;
            }
            break;
          }
        }
      }
      if (v28) {
        unint64_t v220 = *(void *)(v28 + 64);
      }
      else {
        unint64_t v220 = -1;
      }
      size_t v221 = v256;
      if (v256)
      {
        id v222 = 0;
        double v223 = 0.0;
        v224 = (id *)v230;
        v200 = v239;
        do
        {
          if (*((double *)*v224 + 19) == 1.0) {
            break;
          }
          [*v224 confidence];
          if (v223 < v225 && *((void *)*v224 + 8) <= v220)
          {
            char v197 = 1;
            double v223 = v225;
            id v222 = *v224;
          }
          ++v224;
          --v221;
        }
        while (v221);
      }
      else
      {
        id v222 = 0;
        double v223 = 0.0;
        v200 = v239;
      }
      size_t v226 = __nel;
      if (__nel)
      {
        v227 = (id *)v231;
        do
        {
          if (*((double *)*v227 + 19) == 1.0) {
            break;
          }
          [*v227 confidence];
          if (v223 < v228 && *((void *)*v227 + 8) <= v220)
          {
            char v197 = 0;
            double v223 = v228;
            id v222 = *v227;
          }
          ++v227;
          --v226;
        }
        while (v226);
      }
      NSStringEncoding v28 = (NSStringEncoding)v251;
      NSStringEncoding v202 = (NSStringEncoding)v253;
      if (v222) {
        NSStringEncoding v28 = (NSStringEncoding)v222;
      }
      v180 = v237;
    }
    if ((v197 & 1) == 0) {
      NSStringEncoding v202 = (NSStringEncoding)v180;
    }
    if (v28 && v202 && v28 != v202)
    {
      unint64_t v203 = *(void *)(v28 + 64);
      if (v203 && v203 > *(void *)(v202 + 64)) {
        NSStringEncoding v28 = v202;
      }
    }
    else if (!v28)
    {
      uint64_t v204 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_393:
      if (v200) {
        BOOL v205 = v243;
      }
      else {
        BOOL v205 = 0;
      }
      if (v205 && v204 != objc_msgSend((id)objc_msgSend(v249, "objectAtIndex:", 0), "integerValue")
        || (v200 = (void *)v28) != 0)
      {
        NSStringEncoding v28 = [v200 nsEncoding];
      }
      int v206 = v201 ^ 1;
      if (v28) {
        int v206 = 1;
      }
      if ((v206 | !v243))
      {
        if (!v235) {
          goto LABEL_415;
        }
        if (!v28) {
          goto LABEL_415;
        }
        *v235 = (NSString *)generateStringWithEncoding(v200, (uint64_t)v59, v247, 1, v201, v199, &v260);
        if (!v234) {
          goto LABEL_415;
        }
        BOOL v207 = v260;
        v208 = v234;
      }
      else
      {
        if (![v249 count]) {
          goto LABEL_415;
        }
        NSStringEncoding v28 = objc_msgSend((id)objc_msgSend(v249, "objectAtIndex:", 0), "integerValue");
        v209 = +[NSEncodingDetector detectorForCFStringEncoding:CFStringConvertNSStringEncodingToEncoding(v28) allowBackupDetectors:1];
        if (v209)
        {
          v210 = v209;
          uint64_t v211 = [(NSData *)v245 bytes];
          uint64_t v212 = [(NSData *)v245 length];
          [v210 recognizeString:v211 withDataLength:v212 intoBuffer:0];
          uint64_t v213 = generateStringWithEncoding(v210, v211, v212, 1, 1, v199, &v260);
          if (v235)
          {
            if (v213) {
              *v235 = (NSString *)v213;
            }
          }
        }
        v208 = v234;
        if (!v234) {
          goto LABEL_415;
        }
        BOOL v207 = 1;
      }
      BOOL *v208 = v207;
LABEL_415:
      free(v230);
      free(v231);
      return v28;
    }
    uint64_t v204 = [(id)v28 nsEncoding];
    goto LABEL_393;
  }
  uint64_t v92 = v91;
  uint64_t v93 = *(void *)v288;
LABEL_178:
  uint64_t v94 = 0;
  while (1)
  {
    if (*(void *)v288 != v93) {
      objc_enumerationMutation(v90);
    }
    uint64_t v95 = *(void *)(*((void *)&v287 + 1) + 8 * v94);
    if ([(id)v95 recognizeString:v59 withDataLength:v247 intoBuffer:0])
    {
      if (*(unsigned char *)(v95 + 162) && *(void *)(v95 + 72) <= 1uLL) {
        break;
      }
    }
LABEL_187:
    if (v92 == ++v94)
    {
      uint64_t v92 = [v90 countByEnumeratingWithState:&v287 objects:v286 count:16];
      if (!v92) {
        goto LABEL_189;
      }
      goto LABEL_178;
    }
  }
  if (!v235) {
    goto LABEL_268;
  }
  if (!*(void *)(v95 + 64))
  {
    v96 = -[NSString initWithBytes:length:encoding:]([NSString alloc], "initWithBytes:length:encoding:", v59, v247, [(id)v95 nsEncoding]);
    if ([(NSString *)v96 length]) {
      goto LABEL_199;
    }
    goto LABEL_187;
  }
  v96 = (NSString *)generateStringWithEncoding((void *)v95, (uint64_t)v59, v247, 1, v242, v233, &v260);
LABEL_199:
  *v235 = v96;
  if (v234) {
    BOOL *v234 = v260;
  }
LABEL_268:
  BOOL v69 = (void *)v95;
  return [v69 nsEncoding];
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_2(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

uint64_t __113__NSString_NSStringEncodingDetection__stringEncodingForData_encodingOptions_convertedString_usedLossyConversion___block_invoke_3(void *a1, uint64_t a2)
{
  return [*(id *)(a1[4] + 8 * a2) recognizeString:a1[5] withDataLength:a1[6] intoBuffer:0];
}

+ (NSArray)readableTypeIdentifiersForItemProvider
{
  v3[5] = *MEMORY[0x1E4F143B8];
  v3[0] = _MergedGlobals_87();
  v3[1] = off_1EB1E8128();
  void v3[2] = off_1EB1E8130();
  v3[3] = off_1EB1E8138();
  v3[4] = off_1EB1E8140();
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:5];
}

+ (id)_newStringFromUTF16InternalData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  if (![a3 length]) {
    return &stru_1ECA5C228;
  }
  if ((unint64_t)[a3 length] < 2)
  {
    id result = 0;
  }
  else
  {
    id result = (id)objc_msgSend((id)objc_msgSend(a3, "subdataWithRange:", 0, 2), "bytes");
    if (result)
    {
      int v14 = *(unsigned __int16 *)result;
      if (v14 == 65534 || v14 == 65279)
      {
        id v15 = objc_alloc((Class)a1);
        uint64_t v16 = 10;
      }
      else
      {
        id v15 = objc_alloc((Class)a1);
        uint64_t v16 = 2483028224;
      }
      id result = (id)[v15 initWithData:a3 encoding:v16];
    }
  }
  if (a5)
  {
    if (!result)
    {
      int v17 = _NSIPCocoaErrorWithCode(4864, 0, 0, @"The string representation of type “%@” contains invalid data.", v9, v10, v11, v12, (uint64_t)a4);
      id result = 0;
      *a5 = v17;
    }
  }
  return result;
}

+ (id)objectWithItemProviderData:(id)a3 typeIdentifier:(id)a4 error:(id *)a5
{
  v26[1] = *MEMORY[0x1E4F143B8];
  v26[0] = 0;
  uint64_t v9 = _MergedGlobals_87();
  if (off_1EB1E8150((uint64_t)a4, v9)) {
    goto LABEL_2;
  }
  uint64_t v12 = off_1EB1E8128();
  if (off_1EB1E8150((uint64_t)a4, v12))
  {
    id v10 = objc_alloc((Class)a1);
    uint64_t v11 = 10;
    goto LABEL_5;
  }
  uint64_t v21 = off_1EB1E8130();
  if (off_1EB1E8150((uint64_t)a4, v21))
  {
    uint64_t v13 = [a1 _newStringFromUTF16InternalData:a3 typeIdentifier:a4 error:v26];
    goto LABEL_6;
  }
  uint64_t v22 = off_1EB1E8138();
  if (off_1EB1E8150((uint64_t)a4, v22))
  {
LABEL_2:
    id v10 = objc_alloc((Class)a1);
    uint64_t v11 = 4;
LABEL_5:
    uint64_t v13 = [v10 initWithData:a3 encoding:v11];
LABEL_6:
    uint64_t v18 = v13;
    goto LABEL_7;
  }
  uint64_t v23 = off_1EB1E8140();
  if (off_1EB1E8150((uint64_t)a4, v23))
  {
    id v24 = (id)[MEMORY[0x1E4F1CB10] objectWithItemProviderData:a3 typeIdentifier:a4 error:v26];
    if (v26[0]) {
      uint64_t v18 = 0;
    }
    else {
      uint64_t v18 = objc_msgSend(objc_alloc((Class)a1), "initWithString:", objc_msgSend(v24, "absoluteString"));
    }
  }
  else
  {
    uint64_t v18 = 0;
  }
LABEL_7:
  uint64_t v19 = (NSError *)v26[0];
  if (!(v18 | v26[0]))
  {
    uint64_t v19 = _NSIPCocoaErrorWithCode(4864, 0, 0, @"A string could not be instantiated because of an unknown error.", v14, v15, v16, v17, v25);
    v26[0] = v19;
  }
  if (a5 && v19) {
    *a5 = v19;
  }
  return (id)v18;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  v3[1] = *MEMORY[0x1E4F143B8];
  v3[0] = _MergedGlobals_87();
  return (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v3 count:1];
}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  v8[1] = *MEMORY[0x1E4F143B8];
  v8[0] = _MergedGlobals_87();
  uint64_t v3 = (NSArray *)[MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  unint64_t v4 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:self];
  if (objc_msgSend((id)objc_msgSend(v4, "scheme"), "length"))
  {
    int v5 = [v4 isFileURL];
    uint64_t v6 = 32;
    if (v5) {
      uint64_t v6 = 40;
    }
    return [(NSArray *)v3 arrayByAddingObject:(*(uint64_t (**)())((char *)&_MergedGlobals_87 + v6))()];
  }
  return v3;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  if ([a3 isEqualToString:_MergedGlobals_87()])
  {
    (*((void (**)(id, NSData *, void))a4 + 2))(a4, [(NSString *)self dataUsingEncoding:4], 0);
    return 0;
  }
  if (([a3 isEqualToString:off_1EB1E8140()] & 1) == 0
    && ![a3 isEqualToString:off_1EB1E8148()])
  {
    (*((void (**)(id, void, void))a4 + 2))(a4, 0, 0);
    return 0;
  }
  unint64_t v7 = (void *)[MEMORY[0x1E4F1CB10] URLWithString:self];

  return (id)[v7 loadDataWithTypeIdentifier:a3 forItemProviderCompletionHandler:a4];
}

- (NSUInteger)length
{
}

- (unichar)characterAtIndex:(NSUInteger)index
{
}

+ (id)stringWithCString:(const char *)bytes
{
  if (!bytes)
  {
    int v5 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v5);
  }
  uint64_t v3 = (void *)[objc_allocWithZone((Class)a1) initWithCString:bytes];

  return v3;
}

+ (id)stringWithCString:(const char *)bytes length:(NSUInteger)length
{
  unint64_t v4 = (void *)[objc_allocWithZone((Class)a1) initWithCString:bytes length:length];

  return v4;
}

+ (NSString)stringWithBytes:(const void *)a3 length:(unint64_t)a4 encoding:(unint64_t)a5
{
  if (!a3)
  {
    unint64_t v7 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)a1, a2)), 0 reason userInfo];
    objc_exception_throw(v7);
  }
  int v5 = (void *)[objc_allocWithZone((Class)a1) initWithBytes:a3 length:a4 encoding:a5];

  return (NSString *)v5;
}

+ (NSString)stringWithFormat:(id)a3 locale:(id)a4
{
  return (NSString *)-[NSPlaceholderString initWithFormat:locale:arguments:](&__placeholder, "initWithFormat:locale:arguments:", a3, a4, &v5, &v5);
}

+ (id)_stringWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
  uint64_t v6 = (void *)[objc_alloc((Class)a1) _initWithFormat:a3 locale:a4 options:a5 arguments:a6];

  return v6;
}

+ (id)stringWithContentsOfFile:(NSString *)path
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path];

  return v3;
}

+ (id)stringWithContentsOfURL:(NSURL *)url
{
  uint64_t v3 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url];

  return v3;
}

+ (NSString)stringWithContentsOfURL:(NSURL *)url usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  uint64_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfURL:url usedEncoding:enc error:error];

  return (NSString *)v5;
}

+ (NSString)stringWithContentsOfFile:(NSString *)path usedEncoding:(NSStringEncoding *)enc error:(NSError *)error
{
  uint64_t v5 = (void *)[objc_allocWithZone((Class)a1) initWithContentsOfFile:path usedEncoding:enc error:error];

  return (NSString *)v5;
}

- (BOOL)_isCString
{
  return [(NSString *)self _fastCStringContents:0] != 0;
}

- (NSComparisonResult)localizedCompare:(NSString *)string
{
  NSUInteger v5 = [(NSString *)self length];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];

  return -[NSString compare:options:range:locale:](self, "compare:options:range:locale:", string, 0, 0, v5, v6);
}

- (BOOL)localizedHasPrefix:(id)a3
{
  NSUInteger v5 = [(NSString *)self length];
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", a3, 8, 0, v5, [MEMORY[0x1E4F1CA20] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)localizedHasSuffix:(id)a3
{
  NSUInteger v5 = [(NSString *)self length];
  return -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", a3, 12, 0, v5, [MEMORY[0x1E4F1CA20] currentLocale]) != 0x7FFFFFFFFFFFFFFFLL;
}

- (NSRange)localizedStandardRangeOfString:(NSString *)str
{
  NSUInteger v5 = [(NSString *)self length];
  uint64_t v6 = [MEMORY[0x1E4F1CA20] currentLocale];

  NSUInteger v7 = -[NSString rangeOfString:options:range:locale:](self, "rangeOfString:options:range:locale:", str, 129, 0, v5, v6);
  result.NSUInteger length = v8;
  result.NSUInteger location = v7;
  return result;
}

- (void)getCharacters:(unichar *)buffer range:(NSRange)range
{
  if (range.length)
  {
    NSUInteger length = range.length;
    NSUInteger location = range.location;
    do
    {
      *buffer++ = [(NSString *)self characterAtIndex:location++];
      --length;
    }
    while (length);
  }
}

- (NSString)localizedLowercaseString
{
  uint64_t v3 = [MEMORY[0x1E4F1CA20] currentLocale];

  return [(NSString *)self lowercaseStringWithLocale:v3];
}

- (NSString)decomposedStringWithCompatibilityMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKD);

  return (NSString *)Mutable;
}

- (NSString)precomposedStringWithCompatibilityMapping
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringNormalize(Mutable, kCFStringNormalizationFormKC);

  return (NSString *)Mutable;
}

- (NSString)stringByFoldingWithOptions:(NSStringCompareOptions)options locale:(NSLocale *)locale
{
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0);
  CFStringReplaceAll(Mutable, (CFStringRef)self);
  CFStringFold(Mutable, options, (CFLocaleRef)locale);

  return (NSString *)Mutable;
}

- (void)getLineStart:(NSUInteger *)startPtr end:(NSUInteger *)lineEndPtr contentsEnd:(NSUInteger *)contentsEndPtr forRange:(NSRange)range
{
}

- (NSRange)lineRangeForRange:(NSRange)range
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = 0;
  v6[0] = 0;
  -[NSString getLineStart:end:contentsEnd:forRange:](self, "getLineStart:end:contentsEnd:forRange:", v6, &v5, 0, range.location, range.length);
  NSUInteger v3 = v6[0];
  NSUInteger v4 = v5 - v6[0];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

CFStringTokenizerTokenType __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_2(int a1, CFStringTokenizerRef tokenizer)
{
  do
    CFStringTokenizerTokenType Token = CFStringTokenizerAdvanceToNextToken(tokenizer);
  while (!Token && CFStringTokenizerGetCurrentTokenRange(tokenizer).location != -1);
  return Token;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_3(uint64_t a1, void **a2, void **a3, uint64_t a4, unint64_t a5)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x2020000000;
  double v10 = 64.0;
  if (*(void *)(a1 + 40) == 3) {
    double v10 = 4.0;
  }
  unint64_t v23 = vcvtpd_u64_f64((double)a5 / v10);
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  if (*a2) {
    free(*a2);
  }
  if (*a3) {
    free(*a3);
  }
  *a2 = malloc_type_malloc(16 * v21[3], 0x1000040451B5BE8uLL);
  *a3 = malloc_type_malloc(16 * v21[3], 0x1000040451B5BE8uLL);
  unint64_t v11 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFFCFFLL | 0x200;
  if (!*(unsigned char *)(a1 + 80) && a4 != *(void *)(a1 + 56) && a4 + a5 != *(void *)(a1 + 72)) {
    unint64_t v11 = *(void *)(a1 + 48) & 0xFFFFFFFFFFFFF4FFLL | 0x200;
  }
  uint64_t v12 = *(void **)(a1 + 32);
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  id v15[2] = __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4;
  v15[3] = &unk_1E51FA788;
  v15[4] = &v16;
  v15[5] = &v20;
  v15[6] = a2;
  v15[7] = a3;
  objc_msgSend(v12, "enumerateSubstringsInRange:options:usingBlock:", a4, a5, v11, v15);
  uint64_t v13 = v17[3];
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v20, 8);
  return v13;
}

uint64_t __58__NSString_enumerateSubstringsInRange_options_usingBlock___block_invoke_4(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v10 = result;
  uint64_t v11 = *(void *)(*(void *)(*(void *)(result + 32) + 8) + 24);
  uint64_t v12 = *(void *)(*(void *)(result + 40) + 8);
  if (v11 == *(void *)(v12 + 24))
  {
    *(void *)(v12 + 24) = 2 * v11;
    **(void **)(result + 48) = MEMORY[0x185306D80](**(void **)(result + 48), 16 * *(void *)(*(void *)(*(void *)(result + 40) + 8) + 24), 0x1000040451B5BE8, 0);
    NSRange result = MEMORY[0x185306D80](**(void **)(v10 + 56), 16 * *(void *)(*(void *)(*(void *)(v10 + 40) + 8) + 24), 0x1000040451B5BE8, 0);
    **(void **)(v10 + 56) = result;
    uint64_t v11 = *(void *)(*(void *)(*(void *)(v10 + 32) + 8) + 24);
  }
  uint64_t v13 = *(void **)(v10 + 56);
  uint64_t v14 = (void *)(**(void **)(v10 + 48) + 16 * v11);
  *uint64_t v14 = a3;
  v14[1] = a4;
  uint64_t v15 = (void *)(*v13 + 16 * *(void *)(*(void *)(*(void *)(v10 + 32) + 8) + 24));
  *uint64_t v15 = a5;
  v15[1] = a6;
  ++*(void *)(*(void *)(*(void *)(v10 + 32) + 8) + 24);
  return result;
}

- (void)enumerateLinesUsingBlock:(void *)block
{
  v6[5] = *MEMORY[0x1E4F143B8];
  NSUInteger v5 = [(NSString *)self length];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  void v6[2] = __37__NSString_enumerateLinesUsingBlock___block_invoke;
  _WORD v6[3] = &unk_1E51F88F8;
  v6[4] = block;
  -[NSString enumerateSubstringsInRange:options:usingBlock:](self, "enumerateSubstringsInRange:options:usingBlock:", 0, v5, 0, v6);
}

uint64_t __37__NSString_enumerateLinesUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)displayableString
{
  unint64_t v2 = self;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  long long v31 = 0u;
  memset(v30, 0, sizeof(v30));
  long long v27 = 0u;
  NSUInteger v3 = [(NSString *)self length];
  unint64_t v4 = v3;
  NSUInteger v29 = v3;
  *(void *)&v30[0] = 0;
  uint64_t size = 6 * v3;
  NSStringEncoding v28 = v2;
  if (v3)
  {
    if (v3 >= 0x20) {
      uint64_t v5 = 32;
    }
    else {
      uint64_t v5 = v3;
    }
    *(void *)&long long v27 = v5;
    objc_msgSend(v2, sel_getUid("getCharacters:range:"), (char *)v30 + 8, 0, v5, size);
    __int16 v6 = WORD4(v30[0]);
  }
  else
  {
    *(void *)&long long v27 = 0;
    __int16 v6 = -1;
  }
  *((void *)&v27 + 1) = 1;
  WORD4(v31) = v6;
  unint64_t v7 = 1;
  while (v7 - 1 < (unint64_t)v27)
  {
    unsigned int v8 = (unsigned __int16)(v6 - 32);
    int v9 = v6;
    unsigned __int16 v10 = v6 - 9;
    unsigned int v11 = v10;
    unint64_t v12 = (0xD00000A09uLL >> (8 * v10)) & 0xF;
    if (v11 >= 5) {
      LODWORD(v12) = 0;
    }
    if (v8 >= 0x5F) {
      int v13 = v12;
    }
    else {
      int v13 = v9;
    }
    if (v7 >= (unint64_t)v27)
    {
      uint64_t v15 = *(void *)&v30[0] + v27;
      if (v29 <= *(void *)&v30[0] + (void)v27)
      {
        unint64_t v7 = v27 + 1;
        *((void *)&v27 + 1) = v27 + 1;
        __int16 v6 = -1;
        goto LABEL_23;
      }
      if (v29 - (*(void *)&v30[0] + (void)v27) >= 0x20) {
        uint64_t v16 = 32;
      }
      else {
        uint64_t v16 = v29 - (*(void *)&v30[0] + v27);
      }
      *(void *)&v30[0] += v27;
      *(void *)&long long v27 = v16;
      objc_msgSend(v28, sel_getUid("getCharacters:range:"), (char *)v30 + 8, v15, v16);
      __int16 v6 = WORD4(v30[0]);
      WORD4(v31) = WORD4(v30[0]);
      *((void *)&v27 + 1) = 1;
      unint64_t v7 = 1;
      if (!v13)
      {
LABEL_24:
        uint64_t v17 = malloc_type_malloc(size, 0x8EE33347uLL);
        NSUInteger v29 = v4;
        *(void *)&v30[0] = 0;
        NSStringEncoding v28 = v2;
        if (v4)
        {
          if (v4 >= 0x20) {
            unint64_t v4 = 32;
          }
          *(void *)&long long v27 = v4;
          objc_msgSend(v2, sel_getUid("getCharacters:range:"), (char *)v30 + 8, 0, v4);
          unint64_t v18 = WORD4(v30[0]);
          *((void *)&v27 + 1) = 1;
          WORD4(v31) = WORD4(v30[0]);
          uint64_t v19 = 0;
          if ((void)v27)
          {
            do
            {
              if ((v18 - 32) < 0x5F || v18 <= 0xD && ((1 << v18) & 0x2600) != 0)
              {
                v17[v19++] = v18;
              }
              else
              {
                uint64_t v24 = &v17[v19];
                if (v18 > 0x7F)
                {
                  *(_WORD *)uint64_t v24 = 21852;
                  v24[2] = a0123456789abcd[(unint64_t)v18 >> 12];
                  v24[3] = a0123456789abcd[(v18 >> 8) & 0xF];
                  v24[4] = a0123456789abcd[v18 >> 4];
                  v19 += 6;
                  v24[5] = a0123456789abcd[v18 & 0xF];
                }
                else
                {
                  *uint64_t v24 = 92;
                  v24[1] = (v18 >> 6) | 0x30;
                  v24[2] = (v18 >> 3) & 7 | 0x30;
                  v19 += 4;
                  v24[3] = v18 & 7 | 0x30;
                }
              }
              unint64_t v21 = *((void *)&v27 + 1);
              unint64_t v20 = v27;
              if (*((void *)&v27 + 1) >= (unint64_t)v27)
              {
                uint64_t v22 = *(void *)&v30[0] + v27;
                if (v29 <= *(void *)&v30[0] + (void)v27)
                {
                  *((void *)&v27 + 1) = v27 + 1;
                  unint64_t v18 = 0xFFFFLL;
                  WORD4(v31) = -1;
                  unint64_t v21 = v27;
                }
                else
                {
                  if (v29 - (*(void *)&v30[0] + (void)v27) >= 0x20) {
                    uint64_t v23 = 32;
                  }
                  else {
                    uint64_t v23 = v29 - (*(void *)&v30[0] + v27);
                  }
                  *(void *)&v30[0] += v27;
                  *(void *)&long long v27 = v23;
                  objc_msgSend(v28, sel_getUid("getCharacters:range:"), (char *)v30 + 8, v22, v23);
                  unint64_t v21 = 0;
                  unint64_t v18 = WORD4(v30[0]);
                  WORD4(v31) = WORD4(v30[0]);
                  *((void *)&v27 + 1) = 1;
                  unint64_t v20 = v27;
                }
              }
              else
              {
                ++*((void *)&v27 + 1);
                unint64_t v18 = *((unsigned __int16 *)v30 + v21 + 4);
                WORD4(v31) = *((_WORD *)v30 + v21 + 4);
              }
            }
            while (v21 < v20);
          }
        }
        else
        {
          uint64_t v19 = 0;
          long long v27 = xmmword_182106C90;
          WORD4(v31) = -1;
        }
        return (id)objc_msgSend(objc_allocWithZone((Class)NSString), "initWithCStringNoCopy:length:freeWhenDone:", MEMORY[0x185306D80](v17, v19, 677441218, 0), v19, 1);
      }
    }
    else
    {
      uint64_t v14 = (char *)&v27 + 2 * v7++;
      *((void *)&v27 + 1) = v7;
      __int16 v6 = *((_WORD *)v14 + 20);
LABEL_23:
      WORD4(v31) = v6;
      if (!v13) {
        goto LABEL_24;
      }
    }
  }
  return v2;
}

- (BOOL)getExternalRepresentation:(id *)a3 extendedAttributes:(id *)a4 forWritingToURLOrPath:(id)a5 usingEncoding:(unint64_t)a6 error:(id *)a7
{
  v22[1] = *MEMORY[0x1E4F143B8];
  if (a4)
  {
    uint64_t v13 = _NSEncodingToNewDataForExtendedAttribute(a6);
    if (!v13)
    {
      if (a7)
      {
        unint64_t v20 = _NSErrorWithFilePathAndEncoding(517, (uint64_t)a5, a6);
        BOOL result = 0;
        *a7 = v20;
        return result;
      }
      return 0;
    }
    uint64_t v14 = (void *)v13;
    *a4 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v13, @"com.apple.TextEncoding", 0);
  }
  if (!a3) {
    return 1;
  }
  uint64_t v21 = 0;
  v22[0] = 0;
  NSUInteger v15 = [(NSString *)self length];
  if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, v22, a6, 0, 0, v15, 0))
  {
    uint64_t v16 = (void *)[MEMORY[0x1E4F1CA58] dataWithLength:v22[0]];
    uint64_t v17 = [v16 mutableBytes];
    if (-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", v17, v22[0], &v21, a6, 0, 0, v15, 0))
    {
      *a3 = v16;
      return 1;
    }
    if (!a7) {
      return 0;
    }
    uint64_t v19 = _NSErrorWithFilePath(512, (uint64_t)a5);
    goto LABEL_15;
  }
  if (a7)
  {
    uint64_t v19 = _NSErrorWithFilePathAndEncoding(517, (uint64_t)a5, a6);
LABEL_15:
    *a7 = v19;
  }
  return 0;
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, url, useAuxiliaryFile, enc, error);
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile encoding:(NSStringEncoding)enc error:(NSError *)error
{
  return writeStringToURLOrPath(self, path, useAuxiliaryFile, enc, error);
}

- (BOOL)writeToFile:(NSString *)path atomically:(BOOL)useAuxiliaryFile
{
  BOOL v4 = useAuxiliaryFile;
  uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:path];

  return [(NSString *)self writeToURL:v6 atomically:v4];
}

- (BOOL)writeToURL:(NSURL *)url atomically:(BOOL)atomically
{
  BOOL v4 = atomically;
  v9[1] = *(NSError **)MEMORY[0x1E4F143B8];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v7 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v7 = _NSDefaultCStringEncoding();
  }
  v9[0] = 0;
  if (writeStringToURLOrPath(self, url, v4, v7, v9)) {
    return 1;
  }
  if ([(NSError *)v9[0] code] == 517) {
    return writeStringToURLOrPath(self, url, v4, 10, 0);
  }
  return 0;
}

- (id)initWithCString:(const char *)bytes length:(NSUInteger)length
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v7 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v7 = _NSDefaultCStringEncoding();
  }

  return [(NSString *)self initWithBytes:bytes length:length encoding:v7];
}

- (id)initWithCString:(const char *)bytes
{
  if (!bytes)
  {
    unsigned int v8 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v8);
  }
  size_t v5 = strlen(bytes);
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v6 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v6 = _NSDefaultCStringEncoding();
  }

  return [(NSString *)self initWithBytes:bytes length:v5 encoding:v6];
}

- (NSString)initWithCString:(const char *)nullTerminatedCString encoding:(NSStringEncoding)encoding
{
  if (!nullTerminatedCString)
  {
    int v9 = (void *)[MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3C8], +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@: NULL cString", _NSMethodExceptionProem((objc_class *)self, a2)), 0 reason userInfo];
    objc_exception_throw(v9);
  }
  size_t v7 = strlen(nullTerminatedCString);

  return [(NSString *)self initWithBytes:nullTerminatedCString length:v7 encoding:encoding];
}

- (NSString)initWithString:(NSString *)aString
{
  NSUInteger v5 = [(NSString *)aString length];
  if (v5)
  {
    NSUInteger v6 = v5;
    size_t v7 = (malloc_zone_t *)[(NSString *)self zone];
    if (!v7) {
      size_t v7 = malloc_default_zone();
    }
    unsigned int v8 = malloc_type_zone_malloc(v7, 2 * v6, 0x4A6F13AEuLL);
    if (!v8)
    {
      [(NSString *)self dealloc];
      return 0;
    }
    int v9 = v8;
    -[NSString getCharacters:range:](aString, "getCharacters:range:", v8, 0, v6);
    unsigned __int16 v10 = self;
    unsigned int v11 = v9;
    NSUInteger v12 = v6;
    uint64_t v13 = 1;
  }
  else
  {
    unsigned __int16 v10 = self;
    unsigned int v11 = 0;
    NSUInteger v12 = 0;
    uint64_t v13 = 0;
  }

  return [(NSString *)v10 initWithCharactersNoCopy:v11 length:v12 freeWhenDone:v13];
}

- (NSString)initWithData:(NSData *)data encoding:(NSStringEncoding)encoding
{
  size_t v7 = [(NSData *)data bytes];
  unint64_t v8 = [(NSData *)data length];

  return [(NSString *)self initWithBytes:v7 length:v8 encoding:encoding];
}

- (id)_initWithBytesOfUnknownEncoding:(char *)a3 length:(unint64_t)a4 copy:(BOOL)a5 usedEncoding:(unint64_t *)a6
{
  if (!a3) {
    return 0;
  }
  if (a4 < 2 || (a4 & 1) != 0)
  {
LABEL_7:
    unint64_t v9 = 4;
    if (a5) {
      goto LABEL_8;
    }
    goto LABEL_13;
  }
  int v8 = *a3;
  if (v8 == 255)
  {
    if (a3[1] != 254) {
      goto LABEL_7;
    }
  }
  else if (v8 != 254 || a3[1] != 255)
  {
    goto LABEL_7;
  }
  unint64_t v9 = 10;
  if (a5)
  {
LABEL_8:
    id result = -[NSString initWithBytes:length:encoding:](self, "initWithBytes:length:encoding:", a3);
    if (!result) {
      return result;
    }
    goto LABEL_14;
  }
LABEL_13:
  id result = -[NSString initWithBytesNoCopy:length:encoding:freeWhenDone:](self, "initWithBytesNoCopy:length:encoding:freeWhenDone:", a3);
  if (!result)
  {
    free(a3);
    return 0;
  }
LABEL_14:
  if (a6) {
    *a6 = v9;
  }
  return result;
}

- (id)_initWithDataOfUnknownEncoding:(id)a3
{
  unint64_t v5 = [a3 length];
  NSUInteger v6 = (unsigned __int8 *)[a3 bytes];
  if (!a3) {
    return 0;
  }
  if (v5 < 2) {
    goto LABEL_12;
  }
  if ((v5 & 1) == 0)
  {
    int v7 = *v6;
    if (v7 == 255)
    {
      if (v6[1] != 254) {
        goto LABEL_7;
      }
    }
    else if (v7 != 254 || v6[1] != 255)
    {
      goto LABEL_7;
    }
    uint64_t v8 = 10;
    goto LABEL_16;
  }
LABEL_7:
  if (v5 >= 3 && *v6 == 239 && v6[1] == 187 && v6[2] == 191)
  {
    uint64_t v8 = 4;
    goto LABEL_16;
  }
LABEL_12:
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v8 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v8 = _NSDefaultCStringEncoding();
  }
LABEL_16:

  return [(NSString *)self initWithData:a3 encoding:v8];
}

- (id)initWithContentsOfFile:(NSString *)path
{
  BOOL v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfMappedFile:path];
  id v5 = [(NSString *)self _initWithDataOfUnknownEncoding:v4];

  return v5;
}

- (id)initWithContentsOfURL:(NSURL *)url
{
  BOOL v4 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1C9B8]) initWithContentsOfURL:url];
  id v5 = [(NSString *)self _initWithDataOfUnknownEncoding:v4];

  return v5;
}

- (NSString)initWithData:(id)a3 usedEncoding:(unint64_t *)a4
{
  uint64_t v7 = [a3 bytes];
  uint64_t v8 = [a3 length];

  return (NSString *)[(NSString *)self _initWithBytesOfUnknownEncoding:v7 length:v8 copy:1 usedEncoding:a4];
}

- (id)_initWithFormat:(id)a3 options:(id)a4
{
  return -[NSString _initWithFormat:locale:options:arguments:](self, "_initWithFormat:locale:options:arguments:", a3, 0, a4, &v5, &v5);
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5
{
  return -[NSString _initWithFormat:locale:options:arguments:](self, "_initWithFormat:locale:options:arguments:", a3, a4, a5, &v6, &v6);
}

- (id)_initWithFormat:(id)a3 options:(id)a4 arguments:(char *)a5
{
  return [(NSString *)self _initWithFormat:a3 locale:0 options:a4 arguments:a5];
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:](self, "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:", a3, a4, 0, a5, a6, &v7, &v7);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7
{
  return -[NSString _initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:](self, "_initWithValidatedFormat:validFormatSpecifiers:locale:options:error:arguments:", a3, a4, a5, a6, a7, &v8, &v8);
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 options:(id)a5 error:(id *)a6 arguments:(char *)a7
{
  return [(NSString *)self _initWithValidatedFormat:a3 validFormatSpecifiers:a4 locale:0 options:a5 error:a6 arguments:a7];
}

- (NSString)initWithCharactersNoCopy:(unichar *)characters length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithCharactersNoCopy:(unichar *)chars length:(NSUInteger)len deallocator:(void *)deallocator
{
}

- (id)initWithCStringNoCopy:(char *)bytes length:(NSUInteger)length freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding freeWhenDone:(BOOL)freeBuffer
{
}

- (NSString)initWithBytesNoCopy:(void *)bytes length:(NSUInteger)len encoding:(NSStringEncoding)encoding deallocator:(void *)deallocator
{
}

- (NSString)initWithFormat:(NSString *)format locale:(id)locale arguments:(va_list)argList
{
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers error:(NSError *)error
{
  va_start(va, error);
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:](self, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, 0, va, error, va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale error:(NSError *)error
{
  va_start(va, error);
  return -[NSString initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:](self, "initWithValidatedFormat:validFormatSpecifiers:locale:arguments:error:", format, validFormatSpecifiers, locale, va, error, va);
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers arguments:(va_list)argList error:(NSError *)error
{
  return [(NSString *)self initWithValidatedFormat:format validFormatSpecifiers:validFormatSpecifiers locale:0 arguments:argList error:error];
}

- (NSString)initWithValidatedFormat:(NSString *)format validFormatSpecifiers:(NSString *)validFormatSpecifiers locale:(id)locale arguments:(va_list)argList error:(NSError *)error
{
}

- (id)_initWithFormat:(id)a3 locale:(id)a4 options:(id)a5 arguments:(char *)a6
{
}

- (id)_initWithValidatedFormat:(id)a3 validFormatSpecifiers:(id)a4 locale:(id)a5 options:(id)a6 error:(id *)a7 arguments:(char *)a8
{
}

+ (BOOL)_subclassesMustBeExplicitlyMentionedWhenDecoded
{
  return 1;
}

- (id)propertyList
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  id v3 = 0;
  return (id)_CFPropertyListCreateFromXMLString();
}

- (NSDictionary)propertyListFromStringsFileFormat
{
  unint64_t v2 = [(NSString *)self propertyList];
  if (_NSIsNSDictionary()) {
    return v2;
  }
  else {
    return 0;
  }
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength range:(NSRange)aRange remainingRange:(NSRangePointer)leftoverRange
{
  NSUInteger length = aRange.length;
  NSUInteger location = aRange.location;
  v17[1] = *MEMORY[0x1E4F143B8];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v12 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v12 = _NSDefaultCStringEncoding();
  }
  v17[0] = 0;
  if (!-[NSString getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:](self, "getBytes:maxLength:filledLength:encoding:allowLossyConversion:range:remainingRange:", bytes, maxLength, v17, v12, 0, location, length, leftoverRange))
  {
    NSUInteger v13 = [(NSString *)self length];
    uint64_t v14 = self;
    if (v13 >= 0x18) {
      uint64_t v14 = -[NSString stringByAppendingString:](-[NSString substringWithRange:](self, "substringWithRange:", 0, 20), "stringByAppendingString:", @"...");
    }
    NSUInteger v15 = (void *)MEMORY[0x1E4F1CA00];
    uint64_t v16 = +[NSString stringWithFormat:@"Conversion to cString failed for string \"%@\"", v14];
    objc_exception_throw((id)objc_msgSend(v15, "exceptionWithName:reason:userInfo:", @"NSCharacterConversionException", v16, objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", self, @"_NSString", 0)));
  }
  bytes[v17[0]] = 0;
}

- (void)getCString:(char *)bytes maxLength:(NSUInteger)maxLength
{
  NSUInteger v7 = [(NSString *)self length];

  -[NSString getCString:maxLength:range:remainingRange:](self, "getCString:maxLength:range:remainingRange:", bytes, maxLength, 0, v7, 0);
}

- (void)getCString:(char *)bytes
{
  unint64_t v5 = 0x8000000000000000;
  if ((unint64_t)bytes > 0x8000000000000000) {
    unint64_t v5 = (unint64_t)bytes;
  }
  unint64_t v6 = ~v5;
  NSUInteger v7 = [(NSString *)self length];

  -[NSString getCString:maxLength:range:remainingRange:](self, "getCString:maxLength:range:remainingRange:", bytes, v6, 0, v7, 0);
}

- (const)cString
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }

  return (const char *)bytesInEncoding(self, v3, 1, 1, 0);
}

- (NSUInteger)cStringLength
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }
  v5[0] = 0;
  if (-[NSString getBytes:maxLength:usedLength:encoding:options:range:remainingRange:](self, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", 0, 0x7FFFFFFFFFFFFFFELL, v5, v3, 6, 0, [(NSString *)self length], 0))
  {
    return v5[0];
  }
  else
  {
    return 0;
  }
}

- (const)lossyCString
{
  if (__NSDefaultStringEncodingFullyInited) {
    uint64_t v3 = _NSDefaultStringEncoding;
  }
  else {
    uint64_t v3 = _NSDefaultCStringEncoding();
  }

  return (const char *)bytesInEncoding(self, v3, 0, 0, 1u);
}

- (NSStringEncoding)smallestEncoding
{
  NSStringEncoding v3 = 1;
  if (![(NSString *)self canBeConvertedToEncoding:1])
  {
    if (__NSDefaultStringEncodingFullyInited) {
      uint64_t v4 = _NSDefaultStringEncoding;
    }
    else {
      uint64_t v4 = _NSDefaultCStringEncoding();
    }
    if ([(NSString *)self canBeConvertedToEncoding:v4]) {
      return _NSDefaultStringEncoding;
    }
    else {
      return 10;
    }
  }
  return v3;
}

+ (const)availableStringEncodings
{
  unint64_t v2 = (const NSStringEncoding *)availableStringEncodings_encodings;
  if (!availableStringEncodings_encodings)
  {
    NSStringEncoding v3 = (_DWORD *)MEMORY[0x185305830](a1, a2);
    if (*v3 == -1)
    {
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v4 = 0;
      do
      {
        uint64_t v5 = v4 + 1;
        int v6 = v3[++v4];
      }
      while (v6 != -1);
    }
    uint64_t v7 = MEMORY[0x185305830]();
    unint64_t v2 = (const NSStringEncoding *)malloc_type_malloc(8 * v5 + 8, 0x100004000313F17uLL);
    v2[v5] = 0;
    BOOL v8 = v5 < 1;
    uint64_t v9 = v5 - 1;
    if (!v8)
    {
      do
      {
        v2[v9] = CFStringConvertEncodingToNSStringEncoding(*(_DWORD *)(v7 + 4 * v9));
        unint64_t v10 = v9-- + 1;
      }
      while (v10 > 1);
    }
    availableStringEncodings_encodings = (uint64_t)v2;
  }
  return v2;
}

+ (NSString)localizedNameOfStringEncoding:(NSStringEncoding)encoding
{
  CFStringEncoding v4 = CFStringConvertNSStringEncodingToEncoding(encoding);
  if (v4 == -1)
  {
    if (encoding != 134217984 && encoding)
    {
      CFStringEncoding v4 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", encoding);
      }
      CFStringEncoding v4 = 1536;
    }
  }
  CFStringRef NameOfEncoding = CFStringGetNameOfEncoding(v4);
  if (!NameOfEncoding) {
    return (NSString *)&stru_1ECA5C228;
  }
  CFStringRef v6 = NameOfEncoding;
  uint64_t v7 = (void *)_NSFoundationBundle();

  return (NSString *)[v7 localizedStringForKey:v6 value:&stru_1ECA5C228 table:@"EncodingNames"];
}

- (BOOL)_web_isCaseInsensitiveEqualToString:(id)a3
{
  return [(NSString *)self compare:a3 options:3] == NSOrderedSame;
}

- (BOOL)_web_hasCaseInsensitivePrefix:(id)a3
{
  return [(NSString *)self rangeOfString:a3 options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)_web_countOfString:(id)a3
{
  NSUInteger v5 = [(NSString *)self length];
  int64_t v6 = 0;
  uint64_t v7 = 0;
  NSUInteger v8 = v5;
  do
  {
    uint64_t v9 = -[NSString rangeOfString:options:range:](self, "rangeOfString:options:range:", a3, 2, v7, v8);
    if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
      break;
    }
    NSUInteger v8 = v5 - (v9 + v10);
    ++v6;
    uint64_t v7 = v9 + v10;
  }
  while (v9 + v10 < v5);
  return v6;
}

- (BOOL)_web_hasCountryCodeTLD
{
  if ([(NSString *)self _web_looksLikeIPAddress]) {
    return 0;
  }
  uint64_t v4 = [(NSString *)self rangeOfString:@"." options:4];
  return v4 == [(NSString *)self length] - 3;
}

- (BOOL)_web_domainMatches:(id)a3
{
  if (-[NSString _web_isCaseInsensitiveEqualToString:](self, "_web_isCaseInsensitiveEqualToString:"))
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    uint64_t v5 = [a3 length];
    if (v5)
    {
      if ([a3 characterAtIndex:0] == 46
        && ![(NSString *)self _web_looksLikeIPAddress])
      {
        unint64_t v6 = [(NSString *)self length];
        if (v6 >= [a3 length])
        {
          uint64_t v7 = self;
          NSUInteger v8 = a3;
        }
        else
        {
          uint64_t v7 = a3;
          NSUInteger v8 = self;
        }
        LOBYTE(v5) = [v7 rangeOfString:v8 options:13] != 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        LOBYTE(v5) = 0;
      }
    }
  }
  return v5;
}

- (id)_web_domainFromHost
{
  if ([(NSString *)self _web_looksLikeIPAddress]) {
    return self;
  }
  BOOL v4 = [(NSString *)self _web_hasCountryCodeTLD];
  uint64_t v5 = [(NSString *)self _web_countOfString:@"."];
  if (v4)
  {
    if (v5 > 2)
    {
      uint64_t v6 = [(NSString *)self rangeOfString:@".", 4, 0, [(NSString *)self rangeOfString:@"." options:4] options range];
LABEL_11:
      uint64_t v7 = [(NSString *)self rangeOfString:@".", 4, 0, v6 options range];
      return [(NSString *)self substringFromIndex:v7];
    }
  }
  else if (v5 > 1)
  {
    uint64_t v6 = [(NSString *)self rangeOfString:@"." options:4];
    goto LABEL_11;
  }

  return (id)[@"." stringByAppendingString:self];
}

- (id)_web_stringByTrimmingWhitespace
{
  NSUInteger v3 = [(NSString *)self length];
  if (!v3) {
    return self;
  }
  NSUInteger v4 = v3;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  NSUInteger v6 = v4 + 1;
  do
  {
    NSUInteger v7 = v6 - 1;
    if (v6 == 1)
    {
      uint64_t v9 = 0;
      goto LABEL_10;
    }
    int IsCharacterMember = CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v6 - 2]);
    NSUInteger v6 = v7;
  }
  while (IsCharacterMember);
  uint64_t v9 = 0;
  do
  {
    if (!CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v9])) {
      break;
    }
    ++v9;
    --v7;
  }
  while (v7);
LABEL_10:
  if (v4 == v7) {
    return self;
  }

  return -[NSString substringWithRange:](self, "substringWithRange:", v9, v7);
}

- (id)_web_stringByExpandingTildeInPath
{
  NSUInteger v3 = [(NSString *)self stringByExpandingTildeInPath];
  if (![(NSString *)self hasSuffix:@"/"] || [(NSString *)v3 hasSuffix:@"/"]) {
    return v3;
  }

  return [(NSString *)v3 stringByAppendingString:@"/"];
}

- (id)_web_fixedCarbonPOSIXPath
{
  NSUInteger v3 = +[NSFileManager defaultManager];
  if (![(NSFileManager *)v3 fileExistsAtPath:self])
  {
    id v4 = (id)[(NSArray *)[(NSString *)self pathComponents] mutableCopy];
    uint64_t v5 = (void *)[v4 objectAtIndex:1];
    if ([v5 isEqualToString:@"Volumes"])
    {
      uint64_t v5 = (void *)[v4 objectAtIndex:2];
      [v4 removeObjectAtIndex:1];
    }
    if (v5)
    {
      if (objc_msgSend(-[NSFileManager _web_startupVolumeName_nowarn](v3, "_web_startupVolumeName_nowarn"), "isEqualToString:", v5))
      {
        [v4 removeObjectAtIndex:1];
      }
      else
      {
        if (![(NSArray *)[(NSFileManager *)v3 contentsOfDirectoryAtPath:@"/Volumes" error:0] containsObject:v5])return self; {
        [v4 insertObject:@"Volumes" atIndex:1];
        }
      }
      NSUInteger v6 = +[NSString pathWithComponents:v4];
      if ([(NSFileManager *)v3 fileExistsAtPath:v6]) {
        return v6;
      }
    }
  }
  return self;
}

- (_NSRange)_web_rangeOfURLUserPasswordHostPort
{
  uint64_t v3 = [(NSString *)self _web_rangeOfURLResourceSpecifier_nowarn];
  uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v6 = v3,
        uint64_t v7 = v4,
        [(NSString *)self rangeOfString:@"//", 8, v3, v4 options range] == 0x7FFFFFFFFFFFFFFFLL))
  {
    NSUInteger v8 = 0;
  }
  else
  {
    uint64_t v5 = v6 + 2;
    NSUInteger v9 = v7 - 2;
    uint64_t v10 = [(NSString *)self rangeOfString:@"/", 0, v6 + 2, v9 options range];
    if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
      NSUInteger v8 = v9;
    }
    else {
      NSUInteger v8 = v10 - v5;
    }
  }
  NSUInteger v11 = v5;
  result.NSUInteger length = v8;
  result.NSUInteger location = v11;
  return result;
}

- (_NSRange)_web_rangeOfURLHost
{
  uint64_t v3 = [(NSString *)self _web_rangeOfURLUserPasswordHostPort];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_4;
  }
  uint64_t v5 = v3;
  NSUInteger v6 = v4;
  uint64_t v7 = [(NSString *)self rangeOfString:@"@", 0, v3, v4 options range];
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v7 == 0x7FFFFFFFFFFFFFFELL)
    {
LABEL_4:
      NSUInteger v8 = 0;
      uint64_t v5 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_9;
    }
    v6 += v5 + ~v7;
    uint64_t v5 = v7 + 1;
  }
  uint64_t v9 = [(NSString *)self rangeOfString:@":", 0, v5, v6 options range];
  if (v9 == 0x7FFFFFFFFFFFFFFFLL) {
    NSUInteger v8 = v6;
  }
  else {
    NSUInteger v8 = v9 - v5;
  }
LABEL_9:
  NSUInteger v10 = v5;
  result.NSUInteger length = v8;
  result.NSUInteger location = v10;
  return result;
}

- (BOOL)_web_looksLikeAbsoluteURL
{
  return objc_msgSend(-[NSString _web_stringByTrimmingWhitespace](self, "_web_stringByTrimmingWhitespace"), "_web_rangeOfURLScheme_nowarn") != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_web_isFileURL
{
  return [(NSString *)self _web_hasCaseInsensitivePrefix:@"file:"];
}

- (id)_web_URLFragment
{
  uint64_t v3 = [(NSString *)self rangeOfString:@"#" options:2];
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    return 0;
  }

  return [(NSString *)self substringFromIndex:v3];
}

+ (id)_web_stringRepresentationForBytes:(int64_t)a3
{
  if (a3 >= 0) {
    double v4 = (double)a3;
  }
  else {
    double v4 = -(double)a3;
  }
  if (v4 == 0.0)
  {
    uint64_t v5 = "0 bytes";
LABEL_8:
    id result = (id)NSURLLocalizedString(v5);
    goto LABEL_9;
  }
  if (v4 == 1.0)
  {
    uint64_t v5 = "1 byte";
    goto LABEL_8;
  }
  if (v4 >= 100.0)
  {
    double v7 = v4 * 0.0009765625;
    if (v4 >= 1000.0)
    {
      if (v7 >= 9.95)
      {
        if (v7 >= 99.95)
        {
          if (v7 >= 999.5)
          {
            double v7 = v7 * 0.0009765625;
            if (v7 >= 9.95)
            {
              if (v7 >= 99.95)
              {
                if (v7 >= 999.5)
                {
                  double v7 = v7 * 0.0009765625;
                  if (v7 >= 9.95)
                  {
                    if (v7 >= 99.95) {
                      NSUInteger v8 = "%.0f GB";
                    }
                    else {
                      NSUInteger v8 = "%.1f GB (10.0)";
                    }
                  }
                  else
                  {
                    NSUInteger v8 = "%.1f GB (1.0)";
                  }
                }
                else
                {
                  NSUInteger v8 = "%.0f MB";
                }
              }
              else
              {
                NSUInteger v8 = "%.1f MB (10.0)";
              }
            }
            else
            {
              NSUInteger v8 = "%.1f MB (1.0)";
            }
          }
          else
          {
            NSUInteger v8 = "%.0f KB";
          }
        }
        else
        {
          NSUInteger v8 = "%.1f KB (10.0)";
        }
      }
      else
      {
        NSUInteger v8 = "%.1f KB (1.0)";
      }
    }
    else
    {
      NSUInteger v8 = "%.1f KB (0.1)";
    }
    id result = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", NSURLLocalizedString(v8), *(void *)&v7);
  }
  else
  {
    id result = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", NSURLLocalizedString("%.0f bytes"), *(void *)&v4);
  }
LABEL_9:
  if (a3 < 0)
  {
    return (id)[@"-" stringByAppendingString:result];
  }
  return result;
}

- (id)_web_stringByCollapsingNonPrintingCharacters
{
  uint64_t v3 = +[NSString string];
  if (!_MergedGlobals_121)
  {
    double v4 = objc_alloc_init(NSMutableCharacterSet);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 0, 33);
    -[NSMutableCharacterSet addCharactersInRange:](v4, "addCharactersInRange:", 127, 1);
    _MergedGlobals_121 = [(NSMutableCharacterSet *)v4 copy];

    qword_1EB1ED818 = (uint64_t)(id)[(id)_MergedGlobals_121 invertedSet];
  }
  NSUInteger v5 = [(NSString *)self length];
  if (v5)
  {
    NSUInteger v6 = v5;
    unint64_t v7 = 0;
    do
    {
      uint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", qword_1EB1ED818, 0, v7, v6 - v7);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL) {
        break;
      }
      unint64_t v9 = v8;
      uint64_t v10 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:", _MergedGlobals_121, 0, v8, v6 - v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL) {
        unint64_t v11 = v6;
      }
      else {
        unint64_t v11 = v10;
      }
      if (v11 > v9)
      {
        if (v7) {
          [(NSString *)v3 appendString:@" "];
        }
        -[NSString appendString:](v3, "appendString:", -[NSString substringWithRange:](self, "substringWithRange:", v9, v11 - v9));
      }
      unint64_t v7 = v11;
    }
    while (v11 != v6);
  }
  return v3;
}

- (id)_web_filenameByFixingIllegalCharacters
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  id v2 = (id)[(NSString *)self mutableCopy];
  __int16 v4 = 0;
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v4, 1), &stru_1ECA5C228, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @"/", @"-", 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", @":", @"-", 0, 0, objc_msgSend(v2, "length"));
  if ([v2 hasPrefix:@"."])
  {
    do
      objc_msgSend(v2, "deleteCharactersInRange:", 0, 1);
    while (([v2 hasPrefix:@"."] & 1) != 0);
  }
  return v2;
}

- (unsigned)_web_extractFourCharCode
{
  id v2 = [(NSString *)self dataUsingEncoding:30];
  uint64_t v3 = [(NSData *)v2 length];
  if (v3)
  {
    [(NSData *)v2 bytes];
    __memcpy_chk();
    LODWORD(v3) = bswap32(0);
  }
  return v3;
}

- (id)_web_splitAtNonDateCommas_nowarn
{
  [(NSString *)self length];
  uint64_t v3 = (void *)[MEMORY[0x1E4F1CA48] arrayWithCapacity:1];
  uint64_t v4 = [(NSString *)self rangeOfString:@", "];
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = v4;
    unint64_t v7 = 0;
    unint64_t v5 = 0;
    while (1)
    {
      uint64_t v8 = [(NSString *)self rangeOfString:@"expires=", 1, v7, v6 - v7 options range];
      unint64_t v7 = v6 + 1;
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        uint64_t v10 = v8;
        uint64_t v11 = v9;
        uint64_t v12 = v8 - 1;
        unsigned int v13 = [(NSString *)self characterAtIndex:v8 - 1];
        if (v13 > 0x7F)
        {
          if (__maskrune(v13, 0x4000uLL)) {
            goto LABEL_12;
          }
        }
        else if ((*(_DWORD *)(MEMORY[0x1E4F14390] + 4 * v13 + 60) & 0x4000) != 0)
        {
          goto LABEL_12;
        }
        if ([(NSString *)self characterAtIndex:v12] == 59
          || [(NSString *)self characterAtIndex:v12] == 44)
        {
LABEL_12:
          if (v10 + v11 != v6 && v6 < v10 + v11 + 16) {
            goto LABEL_14;
          }
        }
      }
      objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, v6 - v5));
      unint64_t v5 = v6 + 1;
LABEL_14:
      unint64_t v6 = [(NSString *)self rangeOfString:@", ", 2, v6 + 1, [(NSString *)self length] + ~v6 options range];
      if (v6 == 0x7FFFFFFFFFFFFFFFLL) {
        goto LABEL_15;
      }
    }
  }
  unint64_t v5 = 0;
LABEL_15:
  objc_msgSend(v3, "addObject:", -[NSString substringWithRange:](self, "substringWithRange:", v5, -[NSString length](self, "length") - v5));
  return v3;
}

- (id)_web_parseAsKeyValuePair_nowarn
{
  return [(NSString *)self _web_parseAsKeyValuePairHandleQuotes_nowarn:0];
}

- (id)_web_parseAsKeyValuePairHandleQuotes_nowarn:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(NSString *)self rangeOfString:@"="];
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v6 = [(NSString *)self _web_stringByTrimmingWhitespace];
    unint64_t v7 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = v5;
  CFCharacterSetRef Predefined = CFCharacterSetGetPredefined(kCFCharacterSetWhitespace);
  if (v8)
  {
    uint64_t v10 = v8;
    while (1)
    {
      uint64_t v11 = v10 - 1;
      if (!CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v10 - 1]))break; {
      --v10;
      }
      if (!v11) {
        goto LABEL_15;
      }
    }
    if (v10)
    {
      uint64_t v12 = 0;
      uint64_t v11 = v10;
      while (CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v12]))
      {
        ++v12;
        if (!--v11) {
          goto LABEL_15;
        }
      }
      uint64_t v10 = v12;
      goto LABEL_15;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  uint64_t v11 = 0;
LABEL_15:
  unint64_t v6 = -[NSString substringWithRange:](self, "substringWithRange:", v10, v11);
  uint64_t v13 = v8 + 1;
  NSUInteger v14 = [(NSString *)self length];
  NSUInteger v15 = v14 - (v8 + 1);
  if (v14 == v8 + 1)
  {
LABEL_19:
    NSUInteger v17 = 0;
  }
  else
  {
    NSUInteger v16 = v14 - 1;
    while (CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v16]))
    {
      --v16;
      if (!--v15) {
        goto LABEL_19;
      }
    }
    uint64_t v19 = 0;
    NSUInteger v20 = v15 - 2;
    while (1)
    {
      uint64_t v13 = v8 + v19 + 1;
      if (!CFCharacterSetIsCharacterMember(Predefined, [(NSString *)self characterAtIndex:v13])) {
        break;
      }
      ++v19;
      --v20;
      if (v15 == v19)
      {
        NSUInteger v17 = 0;
        uint64_t v13 = v8 + v19 + 1;
        goto LABEL_20;
      }
    }
    NSUInteger v17 = v15 - v19;
    if (v15 - v19 >= 2 && v3)
    {
      int v21 = [(NSString *)self characterAtIndex:v8 + v19 + 1];
      uint64_t v13 = v21 == 34 ? v8 + v19 + 2 : v8 + v19 + 1;
      if (v21 == 34) {
        NSUInteger v17 = v20;
      }
    }
  }
LABEL_20:
  unint64_t v7 = -[NSString substringWithRange:](self, "substringWithRange:", v13, v17);
LABEL_21:

  return +[NSURLKeyValuePair pairWithKey:v6 value:v7];
}

- (_NSRange)_web_rangeOfURLScheme_nowarn
{
  uint64_t v3 = [(NSString *)self rangeOfString:@":"];
  if (v3) {
    BOOL v4 = v3 == 0x7FFFFFFFFFFFFFFFLL;
  }
  else {
    BOOL v4 = 1;
  }
  if (v4) {
    goto LABEL_6;
  }
  NSUInteger v5 = v3;
  if (!_web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet) {
    _web_rangeOfURLScheme_nowarn_InverseSchemeCharacterSet = [+[NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+.-"] invertedSet];
  }
  uint64_t v8 = -[NSString rangeOfCharacterFromSet:options:range:](self, "rangeOfCharacterFromSet:options:range:");
  NSUInteger v6 = 0;
  if (v8 != 0x7FFFFFFFFFFFFFFFLL)
  {
LABEL_6:
    NSUInteger v5 = 0;
    NSUInteger v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  NSUInteger v7 = v5;
  result.NSUInteger length = v7;
  result.NSUInteger location = v6;
  return result;
}

- (_NSRange)_web_rangeOfURLResourceSpecifier_nowarn
{
  uint64_t v4 = 0x7FFFFFFFFFFFFFFFLL;
  if ([(NSString *)self _web_rangeOfURLScheme_nowarn] == 0x7FFFFFFFFFFFFFFFLL)
  {
    NSUInteger v5 = 0;
  }
  else
  {
    uint64_t v4 = v3 + 1;
    NSUInteger v5 = [(NSString *)self length] - (v3 + 1);
  }
  NSUInteger v6 = v4;
  result.NSUInteger length = v5;
  result.NSUInteger location = v6;
  return result;
}

- (id)_web_mimeTypeFromContentTypeHeader_nowarn
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSString *)self componentsSeparatedByString:@","];
  uint64_t v3 = [(NSArray *)v2 count];
  if (!v3) {
    return 0;
  }
  if (v3 != 1)
  {
    id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v8 = [(NSArray *)v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v23 != v10) {
            objc_enumerationMutation(v2);
          }
          objc_msgSend(v7, "addObject:", objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(*(id *)(*((void *)&v22 + 1) + 8 * i), "componentsSeparatedByString:", @";"),
                          "objectAtIndex:",
                          0),
                    "_web_stringByTrimmingWhitespace"),
              "lowercaseString"));
        }
        uint64_t v9 = [(NSArray *)v2 countByEnumeratingWithState:&v22 objects:v21 count:16];
      }
      while (v9);
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v12 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v18;
LABEL_16:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v7);
        }
        NSUInteger v6 = *(void **)(*((void *)&v17 + 1) + 8 * v15);
        if ((objc_msgSend(v6, "_web_hasCaseInsensitivePrefix:", @"text/") & 1) == 0
          && (objc_msgSend(v6, "_web_hasCaseInsensitivePrefix:", @"application/") & 1) == 0
          && [v6 rangeOfString:@"/"] != 0x7FFFFFFFFFFFFFFFLL)
        {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v7 countByEnumeratingWithState:&v17 objects:v16 count:16];
          if (v13) {
            goto LABEL_16;
          }
          goto LABEL_26;
        }
      }
      if (v6) {
        goto LABEL_27;
      }
    }
LABEL_26:
    NSUInteger v6 = (void *)[v7 objectAtIndex:0];
LABEL_27:

    return v6;
  }
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](v2, "objectAtIndex:", 0), "componentsSeparatedByString:", @";"),
                       "objectAtIndex:",
                       0),
                 "_web_stringByTrimmingWhitespace");

  return (id)[v4 lowercaseString];
}

- (id)_web_characterSetFromContentTypeHeader_nowarn
{
  uint64_t v3 = [(NSString *)self rangeOfString:@"charset=" options:1];
  if (!v4) {
    return 0;
  }
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(-[NSArray objectAtIndex:](-[NSString componentsSeparatedByString:](-[NSString substringFromIndex:](self, "substringFromIndex:", v3 + v4), "componentsSeparatedByString:", @","), "objectAtIndex:", 0), "componentsSeparatedByString:", @";"),
                       "objectAtIndex:",
                       0),
                 "_web_stringByTrimmingWhitespace");

  return (id)[v5 lowercaseString];
}

- (id)_web_fileNameFromContentDispositionHeader_nowarn
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = [(NSString *)self componentsSeparatedByString:@";"];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id result = (id)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
  if (result)
  {
    id v4 = result;
    uint64_t v5 = *(void *)v10;
    while (2)
    {
      NSUInteger v6 = 0;
      do
      {
        if (*(void *)v10 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = objc_msgSend(*(id *)(*((void *)&v9 + 1) + 8 * (void)v6), "_web_parseAsKeyValuePairHandleQuotes_nowarn:", 1);
        if (objc_msgSend((id)objc_msgSend(v7, "key"), "_web_isCaseInsensitiveEqualToString:", @"filename"))return (id)objc_msgSend(v7, "value"); {
        NSUInteger v6 = (char *)v6 + 1;
        }
      }
      while (v4 != v6);
      id result = (id)[(NSArray *)v2 countByEnumeratingWithState:&v9 objects:v8 count:16];
      id v4 = result;
      if (result) {
        continue;
      }
      break;
    }
  }
  return result;
}

- (id)_web_stringByReplacingValidPercentEscapes_nowarn
{
  uint64_t v3 = [(NSString *)self dataUsingEncoding:4];
  id v4 = [(NSData *)v3 bytes];
  uint64_t v5 = malloc_type_malloc([(NSData *)v3 length], 0xB2EAAAA7uLL);
  uint64_t v6 = [(NSData *)v3 length];
  id v7 = v5;
  if (v6)
  {
    unint64_t v8 = (unint64_t)&v4[v6];
    id v7 = v5;
    do
    {
      int v9 = *v4;
      BOOL v10 = v9 != 37 || (unint64_t)(v4 + 3) > v8;
      if (v10
        || (unsigned __int8 v11 = v4[1], v12 = v11 - 48, (v11 - 48) >= 0xAu)
        && (v4[1] - 65 <= 0x25 ? (BOOL v13 = ((1 << (v11 - 65)) & 0x3F0000003FLL) == 0) : (BOOL v13 = 1), v13)
        || (unsigned __int8 v14 = v4[2], v15 = v14 - 48, v16 = (v14 - 48), v16 >= 0xA)
        && (v4[2] - 65 <= 0x25 ? (BOOL v17 = ((1 << (v14 - 65)) & 0x3F0000003FLL) == 0) : (BOOL v17 = 1), v17))
      {
        ++v4;
      }
      else
      {
        unsigned __int8 v18 = v14 - 65;
        unsigned int v19 = (v11 - 65);
        if ((v11 - 97) >= 6u) {
          unsigned __int8 v20 = 0;
        }
        else {
          unsigned __int8 v20 = v11 - 87;
        }
        unsigned __int8 v21 = v11 - 55;
        if (v19 <= 5) {
          unsigned __int8 v22 = v21;
        }
        else {
          unsigned __int8 v22 = v20;
        }
        if (v12 < 0xAu) {
          unsigned __int8 v22 = v12;
        }
        char v23 = 16 * v22;
        if ((v14 - 97) >= 6u) {
          char v24 = 0;
        }
        else {
          char v24 = v14 - 87;
        }
        char v25 = v14 - 55;
        if (v18 <= 5u) {
          char v26 = v25;
        }
        else {
          char v26 = v24;
        }
        if (v16 < 0xA) {
          char v26 = v15;
        }
        LOBYTE(v9) = v26 | v23;
        v4 += 3;
      }
      *v7++ = v9;
    }
    while (v4 != (unsigned __int8 *)v8);
  }
  long long v27 = [[NSString alloc] initWithBytes:v5 length:v7 - v5 encoding:4];
  free(v5);
  if (v27) {
    return v27;
  }
  else {
    return self;
  }
}

- (BOOL)_web_isJavaScriptURL
{
  return [(NSString *)self rangeOfString:@"javascript:" options:9] != 0x7FFFFFFFFFFFFFFFLL;
}

- (id)standardizedURLPath
{
  uint64_t v3 = [(NSString *)self pathComponents];
  if (![(NSArray *)v3 count] || ![(NSString *)self length]) {
    return &stru_1ECA5C228;
  }
  if ([(NSArray *)v3 count] != 1
    || (id v4 = @"/",
        (objc_msgSend(-[NSArray objectAtIndex:](v3, "objectAtIndex:", 0), "isEqualToString:", @"/") & 1) == 0))
  {
    id v5 = [(NSArray *)v3 objectAtIndex:0];
    if (([v5 isEqual:@"/"] & 1) != 0 || objc_msgSend(v5, "isEqual:", @"\\""))
    {
      uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithArray:v3];
      [v6 replaceObjectAtIndex:0 withObject:&stru_1ECA5C228];
      uint64_t v7 = 1;
    }
    else
    {
      uint64_t v6 = 0;
      uint64_t v7 = 0;
    }
    if ([(NSString *)self characterAtIndex:[(NSString *)self length] - 1] == 47)
    {
      if (!v6) {
        uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithArray:v3];
      }
      [v6 addObject:&stru_1ECA5C228];
    }
    uint64_t v8 = [(NSArray *)v3 count];
    if (v7 >= v8)
    {
LABEL_22:
      id v4 = (__CFString *)self;
      if (!v6) {
        return v4;
      }
      if ([v6 count])
      {
        if (objc_msgSend((id)objc_msgSend(v6, "objectAtIndex:", 0), "isEqual:", &stru_1ECA5C228))
        {
          [v6 removeObjectAtIndex:0];
          if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_1ECA5C228))
          {
            [v6 removeLastObject];
            BOOL v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/%@/", [v6 componentsJoinedByString:@"/"]);
          }
          else
          {
            BOOL v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"/%@", [v6 componentsJoinedByString:@"/"]);
          }
        }
        else if (objc_msgSend((id)objc_msgSend(v6, "lastObject"), "isEqual:", &stru_1ECA5C228))
        {
          [v6 removeLastObject];
          BOOL v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@/", [v6 componentsJoinedByString:@"/"]);
        }
        else
        {
          BOOL v13 = (NSString *)[v6 componentsJoinedByString:@"/"];
        }
        id v4 = (__CFString *)v13;
      }
      else
      {
        id v4 = &stru_1ECA5C228;
      }
    }
    else
    {
      uint64_t v9 = v8;
      while (1)
      {
        id v10 = [(NSArray *)v3 objectAtIndex:v7];
        uint64_t v11 = [v10 stringByAddingPercentEscapes];
        if (!v11) {
          break;
        }
        uint64_t v12 = v11;
        if ((id)v11 != v10)
        {
          if (!v6) {
            uint64_t v6 = (void *)[objc_allocWithZone(MEMORY[0x1E4F1CA48]) initWithArray:v3];
          }
          [v6 replaceObjectAtIndex:v7 withObject:v12];
        }
        if (v9 == ++v7) {
          goto LABEL_22;
        }
      }
      id v4 = 0;
      if (!v6) {
        return v4;
      }
    }
  }
  return v4;
}

- (id)stringByRemovingPercentEscapes
{
  id v2 = (__CFString *)CFURLCreateStringByReplacingPercentEscapes(0, (CFStringRef)self, &stru_1ECA5C228);

  return v2;
}

- (id)stringByAddingPercentEscapes
{
  id v2 = (__CFString *)CFURLCreateStringByAddingPercentEscapes(0, (CFStringRef)self, 0, 0, 0x8000100u);

  return v2;
}

- (NSString)stringByReplacingPercentEscapesUsingEncoding:(NSStringEncoding)enc
{
  CFStringEncoding v5 = CFStringConvertNSStringEncodingToEncoding(enc);
  if (v5 == -1)
  {
    if (enc != 134217984 && enc)
    {
      CFStringEncoding v5 = -1;
    }
    else
    {
      if (_CFExecutableLinkedOnOrAfter()) {
        NSLog((NSString *)@"Incorrect NSStringEncoding value 0x%04lX detected. Assuming NSASCIIStringEncoding. Will stop this compatibility mapping behavior in the near future.", enc);
      }
      CFStringEncoding v5 = 1536;
    }
  }
  uint64_t v6 = (__CFString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(0, (CFStringRef)self, &stru_1ECA5C228, v5);

  return (NSString *)v6;
}

- (id)_web_HTTPStyleLanguageCodeWithoutRegion
{
  if ([(NSString *)self length] < 3 || [(NSString *)self characterAtIndex:2] != 45) {
    return 0;
  }

  return [(NSString *)self substringToIndex:2];
}

- (NSArray)linguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography tokenRanges:(NSArray *)tokenRanges
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unsigned __int8 v14 = [NSLinguisticTagger alloc];
  char v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:scheme], options);
  [(NSLinguisticTagger *)v15 setString:self];
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, [(NSString *)self length]);
  }

  return -[NSLinguisticTagger tagsInRange:scheme:options:tokenRanges:](v15, "tagsInRange:scheme:options:tokenRanges:", location, length, scheme, options, tokenRanges);
}

- (void)enumerateLinguisticTagsInRange:(NSRange)range scheme:(NSLinguisticTagScheme)scheme options:(NSLinguisticTaggerOptions)options orthography:(NSOrthography *)orthography usingBlock:(void *)block
{
  NSUInteger length = range.length;
  NSUInteger location = range.location;
  unsigned __int8 v14 = [NSLinguisticTagger alloc];
  char v15 = -[NSLinguisticTagger initWithTagSchemes:options:](v14, "initWithTagSchemes:options:", [MEMORY[0x1E4F1C978] arrayWithObject:scheme], options);
  [(NSLinguisticTagger *)v15 setString:self];
  if (orthography) {
    -[NSLinguisticTagger setOrthography:range:](v15, "setOrthography:range:", orthography, 0, [(NSString *)self length]);
  }
  -[NSLinguisticTagger enumerateTagsInRange:scheme:options:usingBlock:](v15, "enumerateTagsInRange:scheme:options:usingBlock:", location, length, scheme, options, block);
}

- (void)_flushRegularExpressionCaches
{
}

- (_NSRange)significantText
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  NSUInteger v3 = [(NSString *)self length];
  if (v3 <= 0x400)
  {
    [(NSString *)self getCharacters:v9];
    unint64_t v5 = 0;
    if (v3)
    {
      while (1)
      {
        int v6 = (unsigned __int16)v9[v5];
        if ((v6 - 48) > 9) {
          break;
        }
        if (v3 == ++v5)
        {
          unint64_t v5 = v3;
          break;
        }
      }
    }
    else
    {
      int v6 = 0;
    }
    if (v6 == 95) {
      NSUInteger v7 = v5 + 1;
    }
    else {
      NSUInteger v7 = v5;
    }
    if (v5 >= v3 - 1)
    {
      NSUInteger v4 = 0;
    }
    else
    {
      v3 -= v7;
      NSUInteger v4 = v7;
    }
  }
  else
  {
    NSUInteger v4 = 0;
  }
  NSUInteger v8 = v3;
  result.NSUInteger length = v8;
  result.NSUInteger location = v4;
  return result;
}

- (void)__graphemeCount
{
  v1 = a1;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (a1)
  {
    uint64_t v5 = 0;
    int v6 = &v5;
    uint64_t v7 = 0x2020000000;
    uint64_t v8 = 0;
    uint64_t v2 = [a1 length];
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    uint64_t v4[2] = __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke;
    v4[3] = &unk_1E51FAEF8;
    v4[4] = &v5;
    objc_msgSend(v1, "enumerateSubstringsInRange:options:usingBlock:", 0, v2, 2, v4);
    v1 = (void *)v6[3];
    _Block_object_dispose(&v5, 8);
  }
  return v1;
}

uint64_t __60__NSString_NSPersonNameComponentsFormatter____graphemeCount__block_invoke(uint64_t result)
{
  return result;
}

@end