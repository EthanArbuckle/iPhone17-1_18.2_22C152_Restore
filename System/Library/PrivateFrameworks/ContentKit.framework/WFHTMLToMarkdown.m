@interface WFHTMLToMarkdown
- (BOOL)code;
- (BOOL)escapeSnob;
- (BOOL)ignoreEmphasis;
- (BOOL)ignoreImages;
- (BOOL)ignoreLinks;
- (BOOL)inlineLinks;
- (BOOL)lastWasList;
- (BOOL)lastWasNewline;
- (BOOL)linksEachParagraph;
- (BOOL)onlywhite:(id)a3;
- (BOOL)pre;
- (BOOL)skipInternalLinks;
- (BOOL)skipwrap:(id)a3;
- (BOOL)space;
- (BOOL)start;
- (BOOL)startpre;
- (BOOL)unicodeSnob;
- (NSDictionary)nameToCodepointMapping;
- (NSDictionary)unifiableN;
- (NSMutableArray)a;
- (NSMutableArray)aStack;
- (NSMutableArray)list;
- (NSMutableArray)outTextList;
- (NSMutableOrderedSet)abbreviationList;
- (NSString)abbreviationData;
- (NSString)abbreviationTitle;
- (NSString)emphasisMark;
- (NSString)maybeAutomaticLink;
- (NSString)outText;
- (NSString)strongMark;
- (NSString)ulItemMark;
- (NSURL)baseURL;
- (WFHTMLToMarkdown)initWithBaseURL:(id)a3;
- (WFPythonHTMLParser)parser;
- (id)charref:(id)a3;
- (id)entityref:(id)a3;
- (id)escapeMD:(id)a3;
- (id)escapeMDSection:(id)a3 snob:(BOOL)a4;
- (id)handleHTML:(id)a3;
- (id)optwrap:(id)a3;
- (id)previousIndex:(id)a3;
- (id)unifiable;
- (id)wrapText:(id)a3 toWidth:(int64_t)a4;
- (int)tagHeaderNumber:(id)a3;
- (int64_t)aCount;
- (int64_t)blockquote;
- (int64_t)bodyWidth;
- (int64_t)outCount;
- (int64_t)p_p;
- (int64_t)quiet;
- (int64_t)style;
- (unsigned)nameToCodepoint:(id)a3;
- (void)addOutput:(id)a3;
- (void)close;
- (void)handleTag:(id)a3 attributes:(id)a4 start:(BOOL)a5;
- (void)output:(id)a3;
- (void)output:(id)a3 pureData:(BOOL)a4 force:(id)a5;
- (void)p;
- (void)parser:(id)a3 foundCharacterRef:(id)a4;
- (void)parser:(id)a3 foundData:(id)a4;
- (void)parser:(id)a3 foundEndTag:(id)a4;
- (void)parser:(id)a3 foundEntityRef:(id)a4;
- (void)parser:(id)a3 foundStartTag:(id)a4 attributes:(id)a5;
- (void)pbr;
- (void)setA:(id)a3;
- (void)setACount:(int64_t)a3;
- (void)setAStack:(id)a3;
- (void)setAbbreviationData:(id)a3;
- (void)setAbbreviationList:(id)a3;
- (void)setAbbreviationTitle:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setBlockquote:(int64_t)a3;
- (void)setBodyWidth:(int64_t)a3;
- (void)setCode:(BOOL)a3;
- (void)setEmphasisMark:(id)a3;
- (void)setEscapeSnob:(BOOL)a3;
- (void)setIgnoreEmphasis:(BOOL)a3;
- (void)setIgnoreImages:(BOOL)a3;
- (void)setIgnoreLinks:(BOOL)a3;
- (void)setInlineLinks:(BOOL)a3;
- (void)setLastWasList:(BOOL)a3;
- (void)setLastWasNewline:(BOOL)a3;
- (void)setLinksEachParagraph:(BOOL)a3;
- (void)setList:(id)a3;
- (void)setMaybeAutomaticLink:(id)a3;
- (void)setNameToCodepointMapping:(id)a3;
- (void)setOutCount:(int64_t)a3;
- (void)setOutText:(id)a3;
- (void)setOutTextList:(id)a3;
- (void)setP_p:(int64_t)a3;
- (void)setParser:(id)a3;
- (void)setPre:(BOOL)a3;
- (void)setQuiet:(int64_t)a3;
- (void)setSkipInternalLinks:(BOOL)a3;
- (void)setSpace:(BOOL)a3;
- (void)setStart:(BOOL)a3;
- (void)setStartpre:(BOOL)a3;
- (void)setStrongMark:(id)a3;
- (void)setStyle:(int64_t)a3;
- (void)setUlItemMark:(id)a3;
- (void)setUnicodeSnob:(BOOL)a3;
- (void)setUnifiableN:(id)a3;
@end

@implementation WFHTMLToMarkdown

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_strongMark, 0);
  objc_storeStrong((id *)&self->_emphasisMark, 0);
  objc_storeStrong((id *)&self->_ulItemMark, 0);
  objc_storeStrong((id *)&self->_abbreviationList, 0);
  objc_storeStrong((id *)&self->_abbreviationData, 0);
  objc_storeStrong((id *)&self->_abbreviationTitle, 0);
  objc_storeStrong((id *)&self->_list, 0);
  objc_storeStrong((id *)&self->_maybeAutomaticLink, 0);
  objc_storeStrong((id *)&self->_aStack, 0);
  objc_storeStrong((id *)&self->_a, 0);
  objc_storeStrong((id *)&self->_outText, 0);
  objc_storeStrong((id *)&self->_outTextList, 0);
  objc_storeStrong((id *)&self->_unifiableN, 0);
  objc_storeStrong((id *)&self->_nameToCodepointMapping, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
}

- (void)setStrongMark:(id)a3
{
}

- (NSString)strongMark
{
  return self->_strongMark;
}

- (void)setEmphasisMark:(id)a3
{
}

- (NSString)emphasisMark
{
  return self->_emphasisMark;
}

- (void)setUlItemMark:(id)a3
{
}

- (NSString)ulItemMark
{
  return self->_ulItemMark;
}

- (void)setAbbreviationList:(id)a3
{
}

- (NSMutableOrderedSet)abbreviationList
{
  return self->_abbreviationList;
}

- (void)setAbbreviationData:(id)a3
{
}

- (NSString)abbreviationData
{
  return self->_abbreviationData;
}

- (void)setAbbreviationTitle:(id)a3
{
}

- (NSString)abbreviationTitle
{
  return self->_abbreviationTitle;
}

- (void)setStyle:(int64_t)a3
{
  self->_style = a3;
}

- (int64_t)style
{
  return self->_style;
}

- (void)setLastWasList:(BOOL)a3
{
  self->_lastWasList = a3;
}

- (BOOL)lastWasList
{
  return self->_lastWasList;
}

- (void)setLastWasNewline:(BOOL)a3
{
  self->_lastWasNewline = a3;
}

- (BOOL)lastWasNewline
{
  return self->_lastWasNewline;
}

- (void)setCode:(BOOL)a3
{
  self->_code = a3;
}

- (BOOL)code
{
  return self->_code;
}

- (void)setStartpre:(BOOL)a3
{
  self->_startpre = a3;
}

- (BOOL)startpre
{
  return self->_startpre;
}

- (void)setPre:(BOOL)a3
{
  self->_pre = a3;
}

- (BOOL)pre
{
  return self->_pre;
}

- (void)setBlockquote:(int64_t)a3
{
  self->_blockquote = a3;
}

- (int64_t)blockquote
{
  return self->_blockquote;
}

- (void)setList:(id)a3
{
}

- (NSMutableArray)list
{
  return self->_list;
}

- (void)setACount:(int64_t)a3
{
  self->_aCount = a3;
}

- (int64_t)aCount
{
  return self->_aCount;
}

- (void)setMaybeAutomaticLink:(id)a3
{
}

- (NSString)maybeAutomaticLink
{
  return self->_maybeAutomaticLink;
}

- (void)setAStack:(id)a3
{
}

- (NSMutableArray)aStack
{
  return self->_aStack;
}

- (void)setA:(id)a3
{
}

- (NSMutableArray)a
{
  return self->_a;
}

- (void)setSpace:(BOOL)a3
{
  self->_space = a3;
}

- (BOOL)space
{
  return self->_space;
}

- (void)setStart:(BOOL)a3
{
  self->_start = a3;
}

- (BOOL)start
{
  return self->_start;
}

- (void)setOutCount:(int64_t)a3
{
  self->_outCount = a3;
}

- (int64_t)outCount
{
  return self->_outCount;
}

- (void)setP_p:(int64_t)a3
{
  self->_p_p = a3;
}

- (int64_t)p_p
{
  return self->_p_p;
}

- (void)setQuiet:(int64_t)a3
{
  self->_quiet = a3;
}

- (int64_t)quiet
{
  return self->_quiet;
}

- (void)setOutText:(id)a3
{
}

- (NSString)outText
{
  return self->_outText;
}

- (void)setOutTextList:(id)a3
{
}

- (NSMutableArray)outTextList
{
  return self->_outTextList;
}

- (void)setUnifiableN:(id)a3
{
}

- (void)setNameToCodepointMapping:(id)a3
{
}

- (void)setParser:(id)a3
{
}

- (WFPythonHTMLParser)parser
{
  return self->_parser;
}

- (void)setIgnoreEmphasis:(BOOL)a3
{
  self->_ignoreEmphasis = a3;
}

- (BOOL)ignoreEmphasis
{
  return self->_ignoreEmphasis;
}

- (void)setIgnoreImages:(BOOL)a3
{
  self->_ignoreImages = a3;
}

- (BOOL)ignoreImages
{
  return self->_ignoreImages;
}

- (void)setIgnoreLinks:(BOOL)a3
{
  self->_ignoreLinks = a3;
}

- (BOOL)ignoreLinks
{
  return self->_ignoreLinks;
}

- (void)setInlineLinks:(BOOL)a3
{
  self->_inlineLinks = a3;
}

- (BOOL)inlineLinks
{
  return self->_inlineLinks;
}

- (void)setSkipInternalLinks:(BOOL)a3
{
  self->_skipInternalLinks = a3;
}

- (BOOL)skipInternalLinks
{
  return self->_skipInternalLinks;
}

- (void)setBodyWidth:(int64_t)a3
{
  self->_bodyWidth = a3;
}

- (int64_t)bodyWidth
{
  return self->_bodyWidth;
}

- (void)setLinksEachParagraph:(BOOL)a3
{
  self->_linksEachParagraph = a3;
}

- (BOOL)linksEachParagraph
{
  return self->_linksEachParagraph;
}

- (void)setEscapeSnob:(BOOL)a3
{
  self->_escapeSnob = a3;
}

- (BOOL)escapeSnob
{
  return self->_escapeSnob;
}

- (void)setUnicodeSnob:(BOOL)a3
{
  self->_unicodeSnob = a3;
}

- (BOOL)unicodeSnob
{
  return self->_unicodeSnob;
}

- (void)setBaseURL:(id)a3
{
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (NSDictionary)unifiableN
{
  unifiableN = self->_unifiableN;
  if (!unifiableN)
  {
    v4 = objc_opt_new();
    v5 = [(WFHTMLToMarkdown *)self unifiable];
    uint64_t v11 = MEMORY[0x263EF8330];
    uint64_t v12 = 3221225472;
    v13 = __30__WFHTMLToMarkdown_unifiableN__block_invoke;
    v14 = &unk_26428A5E0;
    v6 = v4;
    v15 = v6;
    v16 = self;
    [v5 enumerateKeysAndObjectsUsingBlock:&v11];
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedShort:", -[WFHTMLToMarkdown nameToCodepoint:](self, "nameToCodepoint:", @"nbsp", v11, v12, v13, v14));
    [(NSDictionary *)v6 removeObjectForKey:v7];

    v8 = self->_unifiableN;
    self->_unifiableN = v6;
    v9 = v6;

    unifiableN = self->_unifiableN;
  }
  return unifiableN;
}

void __30__WFHTMLToMarkdown_unifiableN__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v4 = NSNumber;
  v5 = *(void **)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  id v7 = a3;
  objc_msgSend(v4, "numberWithUnsignedShort:", objc_msgSend(v6, "nameToCodepoint:", a2));
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  [v5 setObject:v7 forKey:v8];
}

- (id)unifiable
{
  return &unk_26C743CE0;
}

- (unsigned)nameToCodepoint:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"apos"])
  {
    unsigned __int16 v5 = 39;
  }
  else
  {
    v6 = [(WFHTMLToMarkdown *)self nameToCodepointMapping];
    id v7 = [v6 objectForKey:v4];
    unsigned __int16 v5 = [v7 unsignedShortValue];
  }
  return v5;
}

- (NSDictionary)nameToCodepointMapping
{
  nameToCodepointMapping = self->_nameToCodepointMapping;
  if (!nameToCodepointMapping)
  {
    self->_nameToCodepointMapping = (NSDictionary *)&unk_26C743CB8;
    nameToCodepointMapping = (NSDictionary *)&unk_26C743CB8;
  }
  return nameToCodepointMapping;
}

- (void)parser:(id)a3 foundData:(id)a4
{
  id v10 = a4;
  if ([v10 containsString:@"/script>"]) {
    [(WFHTMLToMarkdown *)self setQuiet:[(WFHTMLToMarkdown *)self quiet] - 1];
  }
  unsigned __int16 v5 = [(WFHTMLToMarkdown *)self maybeAutomaticLink];

  if (v5)
  {
    v6 = [(WFHTMLToMarkdown *)self maybeAutomaticLink];
    if ([v6 isEqualToString:v10]
      && +[WFURLDetector stringMatchesExactly:v6])
    {
      id v7 = [NSString stringWithFormat:@"<%@>", v10];
      [(WFHTMLToMarkdown *)self output:v7];

      goto LABEL_13;
    }
    [(WFHTMLToMarkdown *)self output:@"["];
    [(WFHTMLToMarkdown *)self setMaybeAutomaticLink:0];
  }
  if ([(WFHTMLToMarkdown *)self code] || [(WFHTMLToMarkdown *)self pre])
  {
    id v8 = v10;
  }
  else
  {
    uint64_t v9 = [(WFHTMLToMarkdown *)self escapeMDSection:v10 snob:[(WFHTMLToMarkdown *)self escapeSnob]];

    id v8 = (id)v9;
  }
  id v10 = v8;
  [(WFHTMLToMarkdown *)self output:v8 pureData:1 force:0];
LABEL_13:
}

- (void)output:(id)a3 pureData:(BOOL)a4 force:(id)a5
{
  BOOL v6 = a4;
  uint64_t v94 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a5;
  abbreviationData = self->_abbreviationData;
  if (abbreviationData)
  {
    uint64_t v11 = [(NSString *)abbreviationData stringByAppendingString:v8];
    uint64_t v12 = self->_abbreviationData;
    self->_abbreviationData = v11;
  }
  if (![(WFHTMLToMarkdown *)self quiet])
  {
    v83 = self;
    if (v6 && ![(WFHTMLToMarkdown *)self pre])
    {
      v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[ \t\n\r\f\v]+" options:0 error:0];
      v14 = objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v8, 0, 0, objc_msgSend(v8, "length"), @" ");

      if ([v14 length] && objc_msgSend(v14, "characterAtIndex:", 0) == 32)
      {
        [(WFHTMLToMarkdown *)self setSpace:1];
        id v8 = [v14 substringFromIndex:1];
      }
      else
      {
        id v8 = v14;
      }
    }
    uint64_t v15 = [v8 length];
    if (v9 || v15)
    {
      if (-[WFHTMLToMarkdown startpre](self, "startpre") && ([v8 hasPrefix:@"\n"] & 1) == 0)
      {
        uint64_t v16 = [@"\n" stringByAppendingString:v8];

        id v8 = (id)v16;
      }
      v17 = objc_opt_new();
      if ([(WFHTMLToMarkdown *)self blockquote] >= 1)
      {
        uint64_t v18 = 0;
        do
        {
          [v17 appendString:@">"];
          ++v18;
        }
        while ([(WFHTMLToMarkdown *)v83 blockquote] > v18);
      }
      if ((!v9 || ![v8 length] || objc_msgSend(v8, "characterAtIndex:", 0) != 62)
        && [(WFHTMLToMarkdown *)v83 blockquote])
      {
        [v17 appendString:@" "];
      }
      v78 = v17;
      if ([(WFHTMLToMarkdown *)v83 pre])
      {
        v19 = [(WFHTMLToMarkdown *)v83 list];
        uint64_t v20 = [v19 count];

        if (v20)
        {
          v21 = [(WFHTMLToMarkdown *)v83 list];
          uint64_t v22 = [v21 count];

          v23 = v17;
          if (v22)
          {
            unint64_t v24 = 0;
            do
            {
              [v78 appendString:@"    "];
              ++v24;
              v25 = [(WFHTMLToMarkdown *)v83 list];
              unint64_t v26 = [v25 count];
            }
            while (v26 > v24);
          }
        }
        else
        {
          v23 = v17;
          [v17 appendString:@"    "];
        }
        v27 = [@"\n" stringByAppendingString:v23];
        uint64_t v28 = [v8 stringByReplacingOccurrencesOfString:@"\n" withString:v27];

        id v8 = (id)v28;
      }
      if ([(WFHTMLToMarkdown *)v83 startpre])
      {
        [(WFHTMLToMarkdown *)v83 setStartpre:0];
        v29 = [(WFHTMLToMarkdown *)v83 list];
        uint64_t v30 = [v29 count];

        if (v30)
        {
          v31 = [MEMORY[0x263F08708] characterSetWithCharactersInString:@"\n"];
          uint64_t v32 = objc_msgSend(v8, "wf_stringByTrimmingLeadingCharactersInSet:", v31);

          id v8 = (id)v32;
        }
      }
      if ([(WFHTMLToMarkdown *)v83 start])
      {
        [(WFHTMLToMarkdown *)v83 setSpace:0];
        [(WFHTMLToMarkdown *)v83 setP_p:0];
        [(WFHTMLToMarkdown *)v83 setStart:0];
      }
      if ([v9 isEqualToString:@"end"])
      {
        [(WFHTMLToMarkdown *)v83 setP_p:0];
        [(WFHTMLToMarkdown *)v83 addOutput:@"\n"];
        [(WFHTMLToMarkdown *)v83 setSpace:0];
      }
      if ([(WFHTMLToMarkdown *)v83 p_p])
      {
        v33 = objc_opt_new();
        if ([(WFHTMLToMarkdown *)v83 p_p] >= 1)
        {
          uint64_t v34 = 0;
          do
          {
            v35 = [NSString stringWithFormat:@"\n%@", v78];
            [v33 appendString:v35];

            ++v34;
          }
          while ([(WFHTMLToMarkdown *)v83 p_p] > v34);
        }
        [(WFHTMLToMarkdown *)v83 addOutput:v33];
        [(WFHTMLToMarkdown *)v83 setSpace:0];
      }
      if ([(WFHTMLToMarkdown *)v83 space])
      {
        if (![(WFHTMLToMarkdown *)v83 lastWasNewline]) {
          [(WFHTMLToMarkdown *)v83 addOutput:@" "];
        }
        [(WFHTMLToMarkdown *)v83 setSpace:0];
      }
      v36 = [(WFHTMLToMarkdown *)v83 a];
      if ([v36 count])
      {
        if ([(WFHTMLToMarkdown *)v83 p_p] == 2
          && [(WFHTMLToMarkdown *)v83 linksEachParagraph])
        {
        }
        else
        {
          char v37 = [v9 isEqualToString:@"end"];

          v38 = v78;
          if ((v37 & 1) == 0) {
            goto LABEL_71;
          }
        }
        id v76 = v9;
        id v77 = v8;
        int v39 = [v9 isEqualToString:@"end"];
        v40 = v83;
        if (v39) {
          [(WFHTMLToMarkdown *)v83 addOutput:@"\n"];
        }
        v80 = objc_opt_new();
        long long v88 = 0u;
        long long v89 = 0u;
        long long v90 = 0u;
        long long v91 = 0u;
        id obj = [(WFHTMLToMarkdown *)v83 a];
        uint64_t v41 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
        if (v41)
        {
          uint64_t v42 = v41;
          v43 = @"outcount";
          uint64_t v44 = *(void *)v89;
          uint64_t v79 = *(void *)v89;
          do
          {
            uint64_t v45 = 0;
            uint64_t v81 = v42;
            do
            {
              if (*(void *)v89 != v44) {
                objc_enumerationMutation(obj);
              }
              v46 = *(void **)(*((void *)&v88 + 1) + 8 * v45);
              uint64_t v47 = [(WFHTMLToMarkdown *)v40 outCount];
              v48 = [v46 objectForKey:v43];
              uint64_t v49 = [v48 integerValue];

              if (v47 <= v49)
              {
                [v80 addObject:v46];
              }
              else
              {
                v50 = v43;
                v51 = NSString;
                v52 = [v46 objectForKey:@"count"];
                v53 = NSURL;
                v54 = [v46 objectForKey:@"href"];
                v55 = [(WFHTMLToMarkdown *)v40 baseURL];
                v56 = [v53 URLWithString:v54 relativeToURL:v55];
                v57 = [v51 stringWithFormat:@"   [%@]: %@", v52, v56];

                v40 = v83;
                [(WFHTMLToMarkdown *)v83 addOutput:v57];
                v58 = [v46 objectForKey:@"title"];

                if (v58)
                {
                  v59 = NSString;
                  v60 = [v46 objectForKey:@"title"];
                  v61 = [v59 stringWithFormat:@" (\"%@\"", v60];
                  [(WFHTMLToMarkdown *)v83 addOutput:v61];
                }
                [(WFHTMLToMarkdown *)v83 addOutput:@"\n"];

                v43 = v50;
                uint64_t v44 = v79;
                uint64_t v42 = v81;
              }
              ++v45;
            }
            while (v42 != v45);
            uint64_t v42 = [obj countByEnumeratingWithState:&v88 objects:v93 count:16];
          }
          while (v42);
        }

        v62 = [(WFHTMLToMarkdown *)v40 a];
        char v63 = [v62 isEqualToArray:v80];

        id v8 = v77;
        if ((v63 & 1) == 0) {
          [(WFHTMLToMarkdown *)v40 addOutput:@" "];
        }
        [(WFHTMLToMarkdown *)v40 setA:v80];

        id v9 = v76;
      }
      else
      {
      }
      v38 = v78;
LABEL_71:
      v64 = [(WFHTMLToMarkdown *)v83 abbreviationList];
      if ([v64 count])
      {
        int v65 = [v9 isEqualToString:@"end"];

        if (!v65)
        {
LABEL_82:
          [(WFHTMLToMarkdown *)v83 setP_p:0];
          [(WFHTMLToMarkdown *)v83 addOutput:v8];
          [(WFHTMLToMarkdown *)v83 setOutCount:[(WFHTMLToMarkdown *)v83 outCount] + 1];

          goto LABEL_83;
        }
        long long v86 = 0u;
        long long v87 = 0u;
        long long v84 = 0u;
        long long v85 = 0u;
        v64 = [(WFHTMLToMarkdown *)v83 abbreviationList];
        uint64_t v66 = [v64 countByEnumeratingWithState:&v84 objects:v92 count:16];
        if (v66)
        {
          uint64_t v67 = v66;
          id v68 = v9;
          uint64_t v69 = *(void *)v85;
          do
          {
            for (uint64_t i = 0; i != v67; ++i)
            {
              if (*(void *)v85 != v69) {
                objc_enumerationMutation(v64);
              }
              v71 = *(void **)(*((void *)&v84 + 1) + 8 * i);
              v72 = NSString;
              v73 = [v71 abbreviation];
              v74 = [v71 title];
              v75 = [v72 stringWithFormat:@"  *[%@]: %@\n", v73, v74];
              [(WFHTMLToMarkdown *)v83 addOutput:v75];
            }
            uint64_t v67 = [v64 countByEnumeratingWithState:&v84 objects:v92 count:16];
          }
          while (v67);
          id v9 = v68;
          v38 = v78;
        }
      }

      goto LABEL_82;
    }
  }
LABEL_83:
}

- (void)output:(id)a3
{
}

- (void)p
{
}

- (void)pbr
{
  if (![(WFHTMLToMarkdown *)self p_p])
  {
    [(WFHTMLToMarkdown *)self setP_p:1];
  }
}

- (void)handleTag:(id)a3 attributes:(id)a4 start:(BOOL)a5
{
  BOOL v5 = a5;
  v111[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = v10;
  if (v10)
  {
    id v12 = v10;
  }
  else
  {
    id v12 = (id)objc_opt_new();
  }
  int v13 = [(WFHTMLToMarkdown *)self tagHeaderNumber:v8];
  if (v13)
  {
    int v14 = v13;
    [(WFHTMLToMarkdown *)self p];
    if (!v5) {
      goto LABEL_151;
    }
    uint64_t v15 = objc_opt_new();
    if (v14 >= 1)
    {
      do
      {
        [v15 appendString:@"#"];
        --v14;
      }
      while (v14);
    }
    [v15 appendString:@" "];
    [(WFHTMLToMarkdown *)self output:v15];
  }
  if (([v8 isEqualToString:@"p"] & 1) != 0
    || [v8 isEqualToString:@"div"])
  {
    [(WFHTMLToMarkdown *)self p];
  }
  if ([v8 isEqualToString:@"br"] && v5) {
    [(WFHTMLToMarkdown *)self output:@"  \n"];
  }
  if ([v8 isEqualToString:@"hr"] && v5)
  {
    [(WFHTMLToMarkdown *)self p];
    [(WFHTMLToMarkdown *)self output:@"* * *"];
    [(WFHTMLToMarkdown *)self p];
  }
  if (([v8 isEqualToString:@"head"] & 1) != 0
    || ([v8 isEqualToString:@"style"] & 1) != 0
    || [v8 isEqualToString:@"script"])
  {
    int64_t v16 = [(WFHTMLToMarkdown *)self quiet];
    if (v5)
    {
      [(WFHTMLToMarkdown *)self setQuiet:v16 + 1];
      if (([v8 isEqualToString:@"style"] & 1) == 0) {
        goto LABEL_27;
      }
      goto LABEL_23;
    }
    [(WFHTMLToMarkdown *)self setQuiet:v16 - 1];
    if (([v8 isEqualToString:@"style"] & 1) == 0) {
      goto LABEL_27;
    }
    goto LABEL_25;
  }
  if ([v8 isEqualToString:@"style"])
  {
    if (v5)
    {
LABEL_23:
      uint64_t v17 = 1;
LABEL_26:
      [(WFHTMLToMarkdown *)self setStyle:[(WFHTMLToMarkdown *)self style] + v17];
      goto LABEL_27;
    }
LABEL_25:
    uint64_t v17 = -1;
    goto LABEL_26;
  }
LABEL_27:
  if ([v8 isEqualToString:@"body"]) {
    [(WFHTMLToMarkdown *)self setQuiet:0];
  }
  if ([v8 isEqualToString:@"blockquote"])
  {
    if (v5)
    {
      [(WFHTMLToMarkdown *)self p];
      [(WFHTMLToMarkdown *)self output:@"> " pureData:0 force:@"1"];
      [(WFHTMLToMarkdown *)self setStart:1];
      [(WFHTMLToMarkdown *)self setBlockquote:[(WFHTMLToMarkdown *)self blockquote] + 1];
    }
    else
    {
      [(WFHTMLToMarkdown *)self setBlockquote:[(WFHTMLToMarkdown *)self blockquote] - 1];
      [(WFHTMLToMarkdown *)self p];
    }
  }
  if ((([v8 isEqualToString:@"em"] & 1) != 0
     || ([v8 isEqualToString:@"i"] & 1) != 0
     || [v8 isEqualToString:@"u"])
    && ![(WFHTMLToMarkdown *)self ignoreEmphasis])
  {
    uint64_t v18 = [(WFHTMLToMarkdown *)self emphasisMark];
    [(WFHTMLToMarkdown *)self output:v18];
  }
  if ((([v8 isEqualToString:@"strong"] & 1) != 0
     || [v8 isEqualToString:@"b"])
    && ![(WFHTMLToMarkdown *)self ignoreEmphasis])
  {
    v19 = [(WFHTMLToMarkdown *)self strongMark];
    [(WFHTMLToMarkdown *)self output:v19];
  }
  if (([v8 isEqualToString:@"del"] & 1) != 0
    || ([v8 isEqualToString:@"strike"] & 1) != 0
    || [v8 isEqualToString:@"s"])
  {
    if (v5) {
      uint64_t v20 = @"<%@>";
    }
    else {
      uint64_t v20 = @"</%@>";
    }
    v21 = objc_msgSend(NSString, "stringWithFormat:", v20, v8);
    [(WFHTMLToMarkdown *)self output:v21];
  }
  if ((([v8 isEqualToString:@"code"] & 1) != 0
     || [v8 isEqualToString:@"tt"])
    && ![(WFHTMLToMarkdown *)self pre])
  {
  }
  if ([v8 isEqualToString:@"abbr"])
  {
    if (v5)
    {
      [(WFHTMLToMarkdown *)self setAbbreviationData:&stru_26C71CE08];
      uint64_t v22 = [v12 objectForKey:@"title"];
      [(WFHTMLToMarkdown *)self setAbbreviationTitle:v22];
    }
    else
    {
      v23 = [(WFHTMLToMarkdown *)self abbreviationTitle];

      if (v23)
      {
        unint64_t v24 = objc_opt_new();
        v25 = [(WFHTMLToMarkdown *)self abbreviationData];
        [v24 setAbbreviation:v25];

        unint64_t v26 = [(WFHTMLToMarkdown *)self abbreviationTitle];
        [v24 setTitle:v26];

        v27 = [(WFHTMLToMarkdown *)self abbreviationList];
        [v27 addObject:v24];

        [(WFHTMLToMarkdown *)self setAbbreviationTitle:0];
      }
      [(WFHTMLToMarkdown *)self setAbbreviationData:&stru_26C71CE08];
    }
  }
  if (![v8 isEqualToString:@"a"]
    || [(WFHTMLToMarkdown *)self ignoreLinks])
  {
    goto LABEL_75;
  }
  if (v5)
  {
    uint64_t v28 = [v12 objectForKey:@"href"];
    if (v28)
    {
      v29 = (void *)v28;
      if ([(WFHTMLToMarkdown *)self skipInternalLinks])
      {
        uint64_t v30 = [v12 objectForKey:@"href"];
        char v31 = [v30 hasPrefix:@"#"];

        if (v31) {
          goto LABEL_65;
        }
      }
      else
      {
      }
      v40 = [(WFHTMLToMarkdown *)self aStack];
      uint64_t v41 = (void *)[v12 mutableCopy];
      [v40 addObject:v41];

      uint64_t v32 = [v12 objectForKey:@"href"];
      [(WFHTMLToMarkdown *)self setMaybeAutomaticLink:v32];
      goto LABEL_74;
    }
LABEL_65:
    uint64_t v32 = [(WFHTMLToMarkdown *)self aStack];
    v33 = [MEMORY[0x263EFF9D0] null];
    [v32 addObject:v33];

LABEL_74:
LABEL_75:
    if ([v8 isEqualToString:@"img"])
    {
      if (v5 && ![(WFHTMLToMarkdown *)self ignoreImages])
      {
        uint64_t v42 = [v12 objectForKey:@"src"];

        if (v42)
        {
          v43 = [v12 objectForKey:@"src"];
          [v12 setObject:v43 forKey:@"href"];

          uint64_t v44 = [v12 objectForKey:@"alt"];
          uint64_t v45 = (void *)v44;
          v46 = &stru_26C71CE08;
          if (v44) {
            v46 = (__CFString *)v44;
          }
          uint64_t v47 = v46;

          v48 = NSString;
          uint64_t v49 = [(WFHTMLToMarkdown *)self escapeMD:v47];
          v50 = [v48 stringWithFormat:@"![%@]", v49];
          [(WFHTMLToMarkdown *)self output:v50];

          id v51 = v9;
          if ([(WFHTMLToMarkdown *)self inlineLinks])
          {
            v52 = NSString;
            v53 = [v12 objectForKey:@"href"];
            v54 = [(WFHTMLToMarkdown *)self escapeMD:v53];
            [v52 stringWithFormat:@"(%@)", v54];
          }
          else
          {
            v53 = [(WFHTMLToMarkdown *)self previousIndex:v12];
            if (v53)
            {
              v55 = [(WFHTMLToMarkdown *)self a];
              uint64_t v56 = objc_msgSend(v55, "objectAtIndex:", objc_msgSend(v53, "unsignedIntegerValue"));

              id v12 = (id)v56;
            }
            else
            {
              [(WFHTMLToMarkdown *)self setACount:[(WFHTMLToMarkdown *)self aCount] + 1];
              v62 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFHTMLToMarkdown aCount](self, "aCount"));
              [v12 setObject:v62 forKey:@"count"];

              char v63 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFHTMLToMarkdown outCount](self, "outCount"));
              [v12 setObject:v63 forKey:@"outcount"];

              v55 = [(WFHTMLToMarkdown *)self a];
              [v55 addObject:v12];
            }

            v64 = NSString;
            v54 = [v12 objectForKey:@"count"];
            [v64 stringWithFormat:@"[%@]", v54];
          int v65 = };
          [(WFHTMLToMarkdown *)self output:v65];

          id v9 = v51;
        }
      }
    }
    if ([v8 isEqualToString:@"dl"] && v5) {
      [(WFHTMLToMarkdown *)self p];
    }
    goto LABEL_100;
  }
  uint64_t v34 = [(WFHTMLToMarkdown *)self aStack];
  uint64_t v35 = [v34 count];

  if (v35)
  {
    v36 = [(WFHTMLToMarkdown *)self aStack];
    char v37 = [v36 lastObject];

    v38 = [(WFHTMLToMarkdown *)self aStack];
    [v38 removeLastObject];

    int v39 = [(WFHTMLToMarkdown *)self maybeAutomaticLink];

    if (v39)
    {
      [(WFHTMLToMarkdown *)self setMaybeAutomaticLink:0];
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        if ([(WFHTMLToMarkdown *)self inlineLinks])
        {
          v57 = NSString;
          v58 = [v37 objectForKey:@"href"];
          [(WFHTMLToMarkdown *)self escapeMD:v58];
          v60 = id v59 = v9;
          v61 = [v57 stringWithFormat:@"](%@)", v60];
          [(WFHTMLToMarkdown *)self output:v61];

          id v9 = v59;
        }
        else
        {
          id v66 = v9;
          uint64_t v67 = [(WFHTMLToMarkdown *)self previousIndex:v37];
          if (v67)
          {
            id v68 = [(WFHTMLToMarkdown *)self a];
            uint64_t v69 = objc_msgSend(v68, "objectAtIndex:", objc_msgSend(v67, "unsignedIntegerValue"));

            char v37 = (void *)v69;
          }
          else
          {
            [(WFHTMLToMarkdown *)self setACount:[(WFHTMLToMarkdown *)self aCount] + 1];
            v70 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFHTMLToMarkdown aCount](self, "aCount"));
            [v37 setObject:v70 forKey:@"count"];

            v71 = objc_msgSend(NSNumber, "numberWithInteger:", -[WFHTMLToMarkdown outCount](self, "outCount"));
            [v37 setObject:v71 forKey:@"outcount"];

            id v68 = [(WFHTMLToMarkdown *)self a];
            [v68 addObject:v37];
          }

          v72 = NSString;
          v73 = [v37 objectForKey:@"count"];
          v74 = [v72 stringWithFormat:@"][%@]", v73];
          [(WFHTMLToMarkdown *)self output:v74];

          id v9 = v66;
        }
      }
    }
  }
  [v8 isEqualToString:@"img"];
  [v8 isEqualToString:@"dl"];
LABEL_100:
  if ([v8 isEqualToString:@"dt"] && !v5) {
    [(WFHTMLToMarkdown *)self pbr];
  }
  if ([v8 isEqualToString:@"dd"] && v5) {
    [(WFHTMLToMarkdown *)self output:@"    "];
  }
  if ([v8 isEqualToString:@"dd"] && !v5) {
    [(WFHTMLToMarkdown *)self pbr];
  }
  if (([v8 isEqualToString:@"ol"] & 1) != 0
    || [v8 isEqualToString:@"ul"])
  {
    v75 = [(WFHTMLToMarkdown *)self list];
    if ([v75 count])
    {
    }
    else
    {
      BOOL v76 = [(WFHTMLToMarkdown *)self lastWasList];

      if (!v76) {
        [(WFHTMLToMarkdown *)self p];
      }
    }
    if (v5)
    {
      uint64_t v77 = [v12 objectForKey:@"start"];

      if (v77)
      {
        v78 = [v12 objectForKey:@"start"];
        uint64_t v77 = [v78 intValue] - 1;
      }
      v110[0] = @"name";
      v110[1] = @"num";
      v111[0] = v8;
      uint64_t v79 = [NSNumber numberWithInt:v77];
      v111[1] = v79;
      v80 = [NSDictionary dictionaryWithObjects:v111 forKeys:v110 count:2];

      uint64_t v81 = [(WFHTMLToMarkdown *)self list];
      v82 = (void *)[v80 mutableCopy];
      [v81 addObject:v82];
    }
    else
    {
      v83 = [(WFHTMLToMarkdown *)self list];
      uint64_t v84 = [v83 count];

      if (v84)
      {
        long long v85 = [(WFHTMLToMarkdown *)self list];
        [v85 removeLastObject];
      }
    }
    long long v86 = self;
    uint64_t v87 = 1;
  }
  else
  {
    long long v86 = self;
    uint64_t v87 = 0;
  }
  [(WFHTMLToMarkdown *)v86 setLastWasList:v87];
  if ([v8 isEqualToString:@"li"])
  {
    [(WFHTMLToMarkdown *)self pbr];
    if (!v5)
    {
      if (([v8 isEqualToString:@"table"] & 1) == 0) {
        [v8 isEqualToString:@"tr"];
      }
      goto LABEL_145;
    }
    long long v88 = [(WFHTMLToMarkdown *)self list];
    uint64_t v89 = [v88 count];

    id v109 = v9;
    if (v89)
    {
      long long v90 = [(WFHTMLToMarkdown *)self list];
      long long v91 = [v90 lastObject];
    }
    else
    {
      long long v91 = (void *)[&unk_26C743C90 mutableCopy];
    }
    v92 = objc_opt_new();
    v93 = [(WFHTMLToMarkdown *)self list];
    uint64_t v94 = [v93 count];

    if (v94)
    {
      unint64_t v95 = 0;
      do
      {
        [v92 appendString:@"  "];
        ++v95;
        v96 = [(WFHTMLToMarkdown *)self list];
        unint64_t v97 = [v96 count];
      }
      while (v97 > v95);
    }
    [(WFHTMLToMarkdown *)self output:v92];
    v98 = [v91 objectForKey:@"name"];
    char v99 = [v98 isEqualToString:@"ul"];

    if (v99)
    {
      v100 = [(WFHTMLToMarkdown *)self ulItemMark];
      uint64_t v101 = [v100 stringByAppendingString:@" "];
    }
    else
    {
      v102 = [v91 objectForKey:@"name"];
      int v103 = [v102 isEqualToString:@"ol"];

      if (!v103)
      {
LABEL_138:
        [(WFHTMLToMarkdown *)self setStart:1];

        id v9 = v109;
        goto LABEL_139;
      }
      v104 = NSNumber;
      v105 = [v91 objectForKey:@"num"];
      v106 = objc_msgSend(v104, "numberWithInt:", objc_msgSend(v105, "intValue") + 1);
      [v91 setObject:v106 forKey:@"num"];

      v107 = NSString;
      v100 = [v91 objectForKey:@"num"];
      uint64_t v101 = [v107 stringWithFormat:@"%@. ", v100];
    }
    v108 = (void *)v101;
    [(WFHTMLToMarkdown *)self output:v101];

    goto LABEL_138;
  }
LABEL_139:
  if ([v8 isEqualToString:@"table"])
  {
    if (!v5) {
      goto LABEL_145;
    }
  }
  else if (![v8 isEqualToString:@"tr"] || !v5)
  {
    goto LABEL_145;
  }
  [(WFHTMLToMarkdown *)self p];
LABEL_145:
  if ([v8 isEqualToString:@"td"]) {
    [(WFHTMLToMarkdown *)self pbr];
  }
  if ([v8 isEqualToString:@"pre"])
  {
    if (v5) {
      [(WFHTMLToMarkdown *)self setStartpre:1];
    }
    [(WFHTMLToMarkdown *)self setPre:1];
    [(WFHTMLToMarkdown *)self p];
  }
LABEL_151:
}

- (id)escapeMDSection:(id)a3 snob:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = (void *)MEMORY[0x263F08AE8];
  BOOL v6 = NSString;
  v8 = id v7 = a3;
  id v9 = [v5 regularExpressionWithPattern:v8 options:0 error:0];

  id v10 = objc_msgSend(v9, "stringByReplacingMatchesInString:options:range:withTemplate:", v7, 0, 0, objc_msgSend(v7, "length"), @"\\\\$1");

  if (v4) {
    uint64_t v11 = {;
  }
    uint64_t v12 = objc_msgSend(v11, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), @"\\\\$1");

    id v10 = (void *)v12;
  }
  int v13 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(\\s*\\d+)(\\.)(?=\\s)" options:0 error:0];
  int v14 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(\\s*)(\\+)(?=\\s)" options:0 error:0];
  uint64_t v15 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"^(\\s*)(-)(?=\\s|\\-)" options:0 error:0];
  int64_t v16 = objc_msgSend(v13, "stringByReplacingMatchesInString:options:range:withTemplate:", v10, 0, 0, objc_msgSend(v10, "length"), @"$1\\\\$2");

  uint64_t v17 = objc_msgSend(v14, "stringByReplacingMatchesInString:options:range:withTemplate:", v16, 0, 0, objc_msgSend(v16, "length"), @"$1\\\\$2");

  uint64_t v18 = objc_msgSend(v15, "stringByReplacingMatchesInString:options:range:withTemplate:", v17, 0, 0, objc_msgSend(v17, "length"), @"$1\\\\$2");

  return v18;
}

- (id)escapeMD:(id)a3
{
  v3 = (void *)MEMORY[0x263F08AE8];
  id v4 = a3;
  BOOL v5 = [v3 regularExpressionWithPattern:@"([\\\\\\[\\]\\(\\)])" options:0 error:0];
  BOOL v6 = objc_msgSend(v5, "stringByReplacingMatchesInString:options:range:withTemplate:", v4, 0, 0, objc_msgSend(v4, "length"), @"\\\\$1");

  return v6;
}

- (int)tagHeaderNumber:(id)a3
{
  id v3 = a3;
  if ([v3 length] == 2 && objc_msgSend(v3, "characterAtIndex:", 0) == 104)
  {
    int v4 = [v3 characterAtIndex:1];
    if ((v4 - 49) >= 9) {
      int v5 = 0;
    }
    else {
      int v5 = v4 - 48;
    }
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)previousIndex:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 objectForKey:@"href"];

  if (v5)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = [(WFHTMLToMarkdown *)self a];
    uint64_t v6 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v30;
      int v9 = -1;
      while (2)
      {
        uint64_t v10 = 0;
        LODWORD(v27) = v9;
        HIDWORD(v27) = v9 + v7;
        do
        {
          if (*(void *)v30 != v8) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void **)(*((void *)&v29 + 1) + 8 * v10);
          uint64_t v12 = objc_msgSend(v11, "objectForKey:", @"href", v27);
          if (v12)
          {
            int v13 = (void *)v12;
            int v14 = [v11 objectForKey:@"href"];
            uint64_t v15 = [v4 objectForKey:@"href"];
            int v16 = [v14 isEqualToString:v15];

            if (v16)
            {
              uint64_t v17 = [v11 objectForKey:@"title"];
              if (v17)
              {
              }
              else
              {
                uint64_t v18 = [v4 objectForKey:@"title"];

                if (!v18) {
                  goto LABEL_20;
                }
              }
              uint64_t v19 = [v11 objectForKey:@"title"];
              if (v19)
              {
                uint64_t v20 = (void *)v19;
                uint64_t v21 = [v4 objectForKey:@"title"];
                if (v21)
                {
                  uint64_t v22 = (void *)v21;
                  v23 = [v11 objectForKey:@"title"];
                  unint64_t v24 = [v4 objectForKey:@"title"];
                  char v25 = [v23 isEqualToString:v24];

                  if (v25)
                  {
LABEL_20:
                    int v5 = [NSNumber numberWithInt:(v27 + v10 + 1)];
                    goto LABEL_21;
                  }
                }
                else
                {
                }
              }
            }
          }
          ++v10;
        }
        while (v7 != v10);
        uint64_t v7 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        int v9 = HIDWORD(v27);
        if (v7) {
          continue;
        }
        break;
      }
    }
    int v5 = 0;
LABEL_21:
  }
  return v5;
}

- (void)parser:(id)a3 foundEndTag:(id)a4
{
}

- (void)parser:(id)a3 foundStartTag:(id)a4 attributes:(id)a5
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  id v7 = a4;
  id v8 = a5;
  int v9 = objc_opt_new();
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend(v15, "name", (void)v21);
        if (v16)
        {
          uint64_t v17 = (void *)v16;
          uint64_t v18 = [v15 value];

          if (v18)
          {
            uint64_t v19 = [v15 value];
            uint64_t v20 = [v15 name];
            [v9 setObject:v19 forKey:v20];
          }
        }
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  [(WFHTMLToMarkdown *)self handleTag:v7 attributes:v9 start:1];
}

- (void)parser:(id)a3 foundEntityRef:(id)a4
{
  id v5 = [(WFHTMLToMarkdown *)self entityref:a4];
  [(WFHTMLToMarkdown *)self output:v5 pureData:1 force:0];
}

- (void)parser:(id)a3 foundCharacterRef:(id)a4
{
  id v5 = [(WFHTMLToMarkdown *)self charref:a4];
  [(WFHTMLToMarkdown *)self output:v5 pureData:1 force:0];
}

- (id)entityref:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHTMLToMarkdown *)self unifiable];
  uint64_t v6 = [v5 objectForKey:v4];

  if ([(WFHTMLToMarkdown *)self unicodeSnob] || !v6)
  {
    unsigned int v8 = [(WFHTMLToMarkdown *)self nameToCodepoint:v4];
    if (v8) {
      objc_msgSend(NSString, "stringWithFormat:", @"%c", v8);
    }
    else {
    id v7 = [NSString stringWithFormat:@"&%@;", v4];
    }
  }
  else
  {
    id v7 = v6;
  }
  int v9 = v7;

  return v9;
}

- (id)charref:(id)a3
{
  id v4 = a3;
  if (([v4 hasPrefix:@"x"] & 1) != 0 || objc_msgSend(v4, "hasPrefix:", @"X"))
  {
    id v5 = [v4 substringFromIndex:1];
    unsigned __int16 v6 = strtol((const char *)[v5 UTF8String], 0, 16);
  }
  else
  {
    unsigned __int16 v6 = [v4 intValue];
  }
  if ([(WFHTMLToMarkdown *)self unicodeSnob]) {
    goto LABEL_8;
  }
  id v7 = [(WFHTMLToMarkdown *)self unifiableN];
  uint64_t v8 = v6;
  int v9 = [NSNumber numberWithUnsignedShort:v8];
  id v10 = [v7 objectForKey:v9];

  if (!v10)
  {
LABEL_8:
    uint64_t v13 = objc_msgSend(NSString, "stringWithFormat:", @"%c", v6);
  }
  else
  {
    uint64_t v11 = [(WFHTMLToMarkdown *)self unifiableN];
    uint64_t v12 = [NSNumber numberWithUnsignedShort:v8];
    uint64_t v13 = [v11 objectForKey:v12];
  }
  return v13;
}

- (void)close
{
  id v3 = [(WFHTMLToMarkdown *)self parser];
  [v3 close];

  [(WFHTMLToMarkdown *)self pbr];
  [(WFHTMLToMarkdown *)self output:&stru_26C71CE08 pureData:0 force:@"end"];
  id v4 = [(WFHTMLToMarkdown *)self outTextList];
  id v5 = [v4 componentsJoinedByString:&stru_26C71CE08];
  [(WFHTMLToMarkdown *)self setOutText:v5];

  if ([(WFHTMLToMarkdown *)self unicodeSnob])
  {
    objc_msgSend(NSString, "stringWithFormat:", @"%c", -[WFHTMLToMarkdown nameToCodepoint:](self, "nameToCodepoint:", @"nbsp"));
    unsigned __int16 v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    unsigned __int16 v6 = @" ";
  }
  int v9 = v6;
  id v7 = [(WFHTMLToMarkdown *)self outText];
  uint64_t v8 = [v7 stringByReplacingOccurrencesOfString:@"&nbsp_place_holder;" withString:v9];
  [(WFHTMLToMarkdown *)self setOutText:v8];
}

- (id)optwrap:(id)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if ([(WFHTMLToMarkdown *)self bodyWidth])
  {
    id v5 = (id)objc_opt_new();
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v16 = v4;
    unsigned __int16 v6 = [v4 componentsSeparatedByString:@"\n"];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (!v7) {
      goto LABEL_20;
    }
    uint64_t v8 = v7;
    int v9 = 0;
    uint64_t v10 = *(void *)v18;
    while (1)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v10) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v12 length])
        {
          if ([(WFHTMLToMarkdown *)self skipwrap:v12])
          {
            if ([(WFHTMLToMarkdown *)self onlywhite:v12]) {
              continue;
            }
            uint64_t v13 = [v12 stringByAppendingString:@"\n"];
            [v5 appendString:v13];

            goto LABEL_15;
          }
          int v14 = [(WFHTMLToMarkdown *)self wrapText:v12 toWidth:[(WFHTMLToMarkdown *)self bodyWidth]];
          [v5 appendString:v14];

          if ([v12 hasSuffix:@"  "])
          {
            [v5 appendString:@"  \n"];
LABEL_15:
            int v9 = 1;
            continue;
          }
          [v5 appendString:@"\n\n"];
        }
        else if (v9 <= 1)
        {
          [v5 appendString:@"\n"];
          ++v9;
          continue;
        }
        int v9 = 2;
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (!v8)
      {
LABEL_20:

        id v4 = v16;
        goto LABEL_22;
      }
    }
  }
  id v5 = v4;
LABEL_22:

  return v5;
}

- (BOOL)onlywhite:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@" "]) {
    char v4 = 1;
  }
  else {
    char v4 = [v3 isEqualToString:@"  "];
  }

  return v4;
}

- (id)wrapText:(id)a3 toWidth:(int64_t)a4
{
  id v5 = a3;
  unsigned __int16 v6 = [MEMORY[0x263EFF980] arrayWithCapacity:1];
  uint64_t v7 = [MEMORY[0x263F089C0] whitespaceCharacterSet];
  uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"%c", 160);
  [v7 removeCharactersInString:v8];

  uint64_t v22 = v7;
  long long v23 = v5;
  int v9 = [v5 componentsSeparatedByCharactersInSet:v7];
  uint64_t v10 = [v9 count];
  if (v10 >= 1)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    do
    {
      int v14 = [MEMORY[0x263F089D8] stringWithCapacity:1];
      uint64_t v15 = [v14 length];
      do
      {
        if (v13 + v15 + 1 > (unint64_t)a4) {
          break;
        }
        id v16 = [v9 objectAtIndex:v12];
        uint64_t v13 = [v16 length];

        long long v17 = [v9 objectAtIndex:v12];
        [v14 appendString:v17];

        if (++v12 < v11) {
          [v14 appendString:@" "];
        }
        uint64_t v15 = [v14 length];
      }
      while (v12 < v11);
      long long v18 = [MEMORY[0x263F08708] whitespaceCharacterSet];
      long long v19 = objc_msgSend(v14, "wf_stringByTrimmingTrailingCharactersInSet:", v18);

      if ([v19 length]) {
        [v6 addObject:v19];
      }
    }
    while (v12 < v11);
  }
  long long v20 = [v6 componentsJoinedByString:@"\n"];

  return v20;
}

- (BOOL)skipwrap:(id)a3
{
  id v3 = a3;
  if (([v3 hasPrefix:@"    "] & 1) != 0
    || [v3 length] && objc_msgSend(v3, "characterAtIndex:", 0) == 9)
  {
    BOOL v4 = 1;
  }
  else
  {
    id v5 = objc_msgSend(v3, "wf_stringByTrimmingLeadingWhitespaceAndNewlineCharacters");
    if ([v5 hasPrefix:@"--"]
      && (unint64_t)[v5 length] >= 3
      && [v5 characterAtIndex:2] != 45)
    {
      BOOL v4 = 0;
    }
    else if (([v5 hasPrefix:@"-"] & 1) != 0 {
           || ([v5 hasPrefix:@"*"] & 1) != 0)
    }
    {
      BOOL v4 = 1;
    }
    else
    {
      unsigned __int16 v6 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"\\d+\\.\\s" options:0 error:0];
      if (objc_msgSend(v6, "numberOfMatchesInString:options:range:", v5, 4, 0, objc_msgSend(v5, "length")))
      {
        BOOL v4 = 1;
      }
      else
      {
        uint64_t v7 = [MEMORY[0x263F08AE8] regularExpressionWithPattern:@"[-\\*\\+]\\s" options:0 error:0];
        BOOL v4 = objc_msgSend(v7, "numberOfMatchesInString:options:range:", v5, 4, 0, objc_msgSend(v5, "length")) != 0;
      }
    }
  }
  return v4;
}

- (id)handleHTML:(id)a3
{
  id v4 = a3;
  id v5 = [(WFHTMLToMarkdown *)self parser];
  [v5 feed:v4];

  [(WFHTMLToMarkdown *)self close];
  unsigned __int16 v6 = [(WFHTMLToMarkdown *)self outText];
  uint64_t v7 = [(WFHTMLToMarkdown *)self optwrap:v6];

  return v7;
}

- (void)addOutput:(id)a3
{
  id v5 = a3;
  id v4 = [(WFHTMLToMarkdown *)self outTextList];
  [v4 addObject:v5];

  if ([v5 length]) {
    -[WFHTMLToMarkdown setLastWasNewline:](self, "setLastWasNewline:", [v5 hasSuffix:@"\n"]);
  }
}

- (WFHTMLToMarkdown)initWithBaseURL:(id)a3
{
  id v5 = a3;
  v27.receiver = self;
  v27.super_class = (Class)WFHTMLToMarkdown;
  unsigned __int16 v6 = [(WFHTMLToMarkdown *)&v27 init];
  if (v6)
  {
    uint64_t v7 = objc_opt_new();
    uint64_t v8 = (void *)*((void *)v6 + 5);
    *((void *)v6 + 5) = v7;

    [*((id *)v6 + 5) setDelegate:v6];
    objc_storeStrong((id *)v6 + 3, a3);
    *((void *)v6 + 4) = 0;
    *((void *)v6 + 1) = 0x101000000;
    int v9 = (void *)*((void *)v6 + 23);
    *((void *)v6 + 23) = @"*";

    uint64_t v10 = (void *)*((void *)v6 + 24);
    *((void *)v6 + 24) = @"_";

    uint64_t v11 = (void *)*((void *)v6 + 25);
    *((void *)v6 + 25) = @"**";

    uint64_t v12 = objc_opt_new();
    uint64_t v13 = (void *)*((void *)v6 + 8);
    *((void *)v6 + 8) = v12;

    *((void *)v6 + 10) = 0;
    *((void *)v6 + 11) = 0;
    *((void *)v6 + 12) = 0;
    *((_WORD *)v6 + 8) = 1;
    uint64_t v14 = objc_opt_new();
    uint64_t v15 = (void *)*((void *)v6 + 13);
    *((void *)v6 + 13) = v14;

    uint64_t v16 = objc_opt_new();
    long long v17 = (void *)*((void *)v6 + 14);
    *((void *)v6 + 14) = v16;

    long long v18 = (void *)*((void *)v6 + 15);
    *((void *)v6 + 15) = 0;

    *((void *)v6 + 16) = 0;
    uint64_t v19 = objc_opt_new();
    long long v20 = (void *)*((void *)v6 + 17);
    *((void *)v6 + 17) = v19;

    v6[22] = 0;
    *(_DWORD *)(v6 + 18) = 0;
    *((void *)v6 + 18) = 0;
    *((void *)v6 + 19) = 0;
    long long v21 = (void *)*((void *)v6 + 20);
    *((void *)v6 + 20) = 0;

    uint64_t v22 = (void *)*((void *)v6 + 21);
    *((void *)v6 + 21) = 0;

    uint64_t v23 = objc_opt_new();
    long long v24 = (void *)*((void *)v6 + 22);
    *((void *)v6 + 22) = v23;

    char v25 = v6;
  }

  return (WFHTMLToMarkdown *)v6;
}

@end