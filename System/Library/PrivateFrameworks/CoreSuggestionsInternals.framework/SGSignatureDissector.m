@interface SGSignatureDissector
+ (id)singleLineSignatureLeadingCharacterSet;
- (BOOL)_paragraphWithContent:(id)a3 range:(_NSRange)a4 exceedsLineLimit:(unint64_t)a5 orCharacterLimit:(unint64_t)a6;
- (BOOL)shouldIgnoreSignature:(id)a3 signatureRange:(_NSRange *)a4 isInhuman:(BOOL *)a5;
- (_NSRange)findSignaturePrefix:(id)a3;
- (_NSRange)findValediction:(id)a3;
- (_NSRange)hmmPlausibleSignatureRange:(id)a3;
- (_NSRange)hmmSignatureRange:(id)a3;
- (_NSRange)hmmSignatureRangeWithContent:(id)a3 detectedData:(id)a4 quotedRegions:(id)a5 authorName:(id)a6;
- (_NSRange)miniSignatureRange:(id)a3;
- (_NSRange)rangeOfSenderName:(id)a3 inRange:(_NSRange)a4 restrictLength:(BOOL)a5 forMessage:(id)a6;
- (_NSRange)rangeOfSenderNameComponents:(id)a3 withFullname:(id)a4 inSubstring:(id)a5;
- (_NSRange)signatureRange:(id)a3;
- (_NSRange)trailingSenderNameLineRange:(id)a3;
- (id)authorFirstname:(id)a3;
- (id)authorName:(id)a3;
- (id)findRejectSig:(id)a3;
- (id)findSignaturePrefixesInMessage:(id)a3 withSignaturePrefixes:(id)a4;
- (id)findValedictionCommencedSignatureRanges:(id)a3;
- (id)initIgnoringDataDetectors;
- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5;
@end

@implementation SGSignatureDissector

+ (id)singleLineSignatureLeadingCharacterSet
{
  if (singleLineSignatureLeadingCharacterSet_onceToken != -1) {
    dispatch_once(&singleLineSignatureLeadingCharacterSet_onceToken, &__block_literal_global_114_22905);
  }
  v2 = (void *)singleLineSignatureLeadingCharacterSet_charset;
  return v2;
}

void __62__SGSignatureDissector_singleLineSignatureLeadingCharacterSet__block_invoke()
{
  v0 = [MEMORY[0x1E4F28B88] symbolCharacterSet];
  id v5 = (id)[v0 mutableCopy];

  v1 = [MEMORY[0x1E4F28B88] punctuationCharacterSet];
  [v5 formUnionWithCharacterSet:v1];

  v2 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  [v5 formUnionWithCharacterSet:v2];

  uint64_t v3 = [v5 copy];
  v4 = (void *)singleLineSignatureLeadingCharacterSet_charset;
  singleLineSignatureLeadingCharacterSet_charset = v3;
}

- (void).cxx_destruct
{
}

- (BOOL)shouldIgnoreSignature:(id)a3 signatureRange:(_NSRange *)a4 isInhuman:(BOOL *)a5
{
  uint64_t v246 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  context = (void *)MEMORY[0x1CB79B230]();
  v198 = a4;
  NSUInteger length = a4->length;
  NSUInteger location = a4->location;
  *a5 = 0;
  v199 = v7;
  if (location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v186 = a5;
    v9 = [v7 textContent];
    unint64_t v10 = [v9 length];

    if (location > v10)
    {
      v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature with a signature that starts after the content.", buf, 2u);
      }
      goto LABEL_12;
    }
    v11 = [v7 textContent];
    unint64_t v12 = [v11 length];

    if (length + location > v12)
    {
      v8 = sgLogHandle();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature on an entity with no detected signature.", buf, 2u);
      }
      goto LABEL_12;
    }
    v15 = objc_opt_new();
    *(void *)buf = 0;
    v238 = buf;
    uint64_t v239 = 0x2020000000;
    uint64_t v240 = 0;
    v16 = [v7 quotedRegions];
    v233[0] = MEMORY[0x1E4F143A8];
    v233[1] = 3221225472;
    v233[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke;
    v233[3] = &unk_1E65B9B40;
    v236 = buf;
    id v17 = v15;
    id v234 = v17;
    id v193 = v7;
    id v235 = v193;
    [v16 enumerateRangesUsingBlock:v233];

    unint64_t v18 = *((void *)v238 + 3);
    v19 = [v193 textContent];
    LODWORD(v18) = v18 < [v19 length];

    if (v18)
    {
      v20 = [v193 textContent];
      v21 = [v20 substringFromIndex:*((void *)v238 + 3)];
      [v17 addObject:v21];

      v22 = [v193 textContent];
      uint64_t v23 = [v22 length];
      *((void *)v238 + 3) = v23;
    }
    v185 = objc_msgSend(NSString, "_pas_proxyStringByConcatenatingStrings:", v17);

    v24 = (void *)MEMORY[0x1CB79B230]();
    v25 = objc_msgSend(v185, "substringWithRange:", v198->location, v198->length);
    v26 = patterns_22951();
    v27 = [v26 regex2ForKey:@"InhumanSig"];
    v28 = [v27 existsInString:v25];

    if (v28)
    {
      v29 = sgLogHandle();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1CA650000, v29, OS_LOG_TYPE_DEBUG, "Tagging as inhuman: Signature pattern", v206, 2u);
      }

      v30 = sgLogHandle();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1CA650000, v30, OS_LOG_TYPE_DEBUG, "Ignoring signature: Inhuman pattern.", v206, 2u);
      }

      BOOL *v186 = 1;
    }

    if (v28)
    {
      BOOL v13 = 1;
LABEL_200:

      _Block_object_dispose(buf, 8);
      goto LABEL_13;
    }
    unint64_t v31 = [(SGSignatureDissector *)self findSignaturePrefix:v193];
    if (v32)
    {
      NSUInteger v33 = v198->location - v31;
      if (v198->location < v31)
      {
        NSUInteger v34 = v198->length;
        if (v31 + v32 < v34 + v198->location)
        {
          v198->NSUInteger location = v31;
          v198->NSUInteger length = v33 + v34;
        }
      }
    }
    unint64_t v35 = [(SGSignatureDissector *)self findValediction:v193];
    if (v36 && v198->length + v198->location <= v35)
    {
      v61 = sgLogHandle();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)v206 = 0;
        _os_log_debug_impl(&dword_1CA650000, v61, OS_LOG_TYPE_DEBUG, "Ignoring signature: Valediction after signature.", v206, 2u);
      }
      BOOL v13 = 1;
      goto LABEL_199;
    }
    v37 = +[SGContactStoreFactory contactStore];
    v187 = +[SGCuratedContactMatcher fetchMeContactFromContactStore:v37];

    unint64_t v39 = v198->location;
    NSUInteger v38 = v198->length;
    obuint64_t j = [v187 givenName];
    if (!obj)
    {
LABEL_44:
      v60 = [v187 phoneNumbers];
      if ([v60 count])
      {

LABEL_50:
        long long v231 = 0u;
        long long v232 = 0u;
        long long v229 = 0u;
        long long v230 = 0u;
        v64 = [v193 plainTextDetectedData];
        uint64_t v65 = [v64 countByEnumeratingWithState:&v229 objects:v245 count:16];
        obuint64_t j = v64;
        if (!v65) {
          goto LABEL_90;
        }
        v189 = *(void **)v230;
        while (1)
        {
          uint64_t v66 = 0;
          uint64_t v191 = v65;
          do
          {
            if (*(void **)v230 != v189) {
              objc_enumerationMutation(obj);
            }
            v67 = *(void **)(*((void *)&v229 + 1) + 8 * v66);
            v68 = (void *)MEMORY[0x1CB79B230]();
            v247.NSUInteger location = [v67 range];
            if (NSIntersectionRange(v247, *v198).length)
            {
              if ([v67 matchType])
              {
                if ([v67 matchType] == 1)
                {
                  v69 = [v193 textContent];
                  uint64_t v70 = [v67 valueRange];
                  v72 = objc_msgSend(v69, "substringWithRange:", v70, v71);

                  long long v227 = 0u;
                  long long v228 = 0u;
                  long long v225 = 0u;
                  long long v226 = 0u;
                  v73 = [v187 postalAddresses];
                  uint64_t v74 = [v73 countByEnumeratingWithState:&v225 objects:v244 count:16];
                  if (v74)
                  {
                    uint64_t v75 = *(void *)v226;
LABEL_60:
                    uint64_t v76 = 0;
                    while (1)
                    {
                      if (*(void *)v226 != v75) {
                        objc_enumerationMutation(v73);
                      }
                      v77 = *(void **)(*((void *)&v225 + 1) + 8 * v76);
                      v78 = (void *)MEMORY[0x1CB79B230]();
                      int v79 = SGPostalAddressesMatchWithParsed(v77, v72, 0, 0, 0, 0, 1);
                      char v80 = v79;
                      if (v79)
                      {
                        v81 = sgLogHandle();
                        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG))
                        {
                          *(_WORD *)v206 = 0;
                          _os_log_debug_impl(&dword_1CA650000, v81, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's postal.", v206, 2u);
                        }
                      }
                      if (v80) {
                        break;
                      }
                      if (v74 == ++v76)
                      {
                        uint64_t v74 = [v73 countByEnumeratingWithState:&v225 objects:v244 count:16];
                        if (v74) {
                          goto LABEL_60;
                        }
                        goto LABEL_70;
                      }
                    }
LABEL_78:
                    int v82 = 1;
                  }
                  else
                  {
LABEL_70:
                    int v82 = 0;
                  }

LABEL_81:
                  goto LABEL_82;
                }
                if ([v67 matchType] != 2)
                {
                  int v82 = 0;
                  goto LABEL_82;
                }
                v91 = [v193 textContent];
                uint64_t v92 = [v67 valueRange];
                v72 = objc_msgSend(v91, "substringWithRange:", v92, v93);

                v94 = [v187 emailAddresses];
                v95 = SGNormalizeEmailAddress();
                int v96 = [v94 containsObject:v95];

                if (v96)
                {
                  v73 = sgLogHandle();
                  if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_78;
                  }
                  *(_WORD *)v206 = 0;
                  v89 = v73;
                  v90 = "Ignoring signature: Recipient's email.";
                  goto LABEL_88;
                }
              }
              else
              {
                v83 = [v193 textContent];
                uint64_t v84 = [v67 valueRange];
                v72 = objc_msgSend(v83, "substringWithRange:", v84, v85);

                v86 = [v187 phoneNumbers];
                v87 = SGNormalizePhoneNumber();
                int v88 = [v86 containsObject:v87];

                if (v88)
                {
                  v73 = sgLogHandle();
                  if (!os_log_type_enabled(v73, OS_LOG_TYPE_DEBUG)) {
                    goto LABEL_78;
                  }
                  *(_WORD *)v206 = 0;
                  v89 = v73;
                  v90 = "Ignoring signature: Recipient's phone.";
LABEL_88:
                  _os_log_debug_impl(&dword_1CA650000, v89, OS_LOG_TYPE_DEBUG, v90, v206, 2u);
                  goto LABEL_78;
                }
              }
              int v82 = 0;
              goto LABEL_81;
            }
            int v82 = 3;
LABEL_82:
            if (v82 != 3 && v82) {
              goto LABEL_150;
            }
            ++v66;
          }
          while (v66 != v191);
          uint64_t v65 = [obj countByEnumeratingWithState:&v229 objects:v245 count:16];
          if (!v65)
          {
LABEL_90:

            goto LABEL_91;
          }
        }
      }
      v62 = [v187 postalAddresses];
      BOOL v63 = [v62 count] == 0;

      if (!v63) {
        goto LABEL_50;
      }
LABEL_91:
      obuint64_t j = [(SGSignatureDissector *)self authorName:v193];
      if (!obj
        || (nontokenCharset(),
            v97 = objc_claimAutoreleasedReturnValue(),
            [obj stringByTrimmingCharactersInSet:v97],
            v98 = objc_claimAutoreleasedReturnValue(),
            BOOL v99 = [v98 length] == 0,
            v98,
            v97,
            v99))
      {
        sgLogHandle();
        v101 = (SGPlainTextContentCursor *)objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(&v101->super, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v206 = 0;
          _os_log_debug_impl(&dword_1CA650000, &v101->super, OS_LOG_TYPE_DEBUG, "Ignoring signature: Sender's name unavailable.", v206, 2u);
        }
      }
      else
      {
        unint64_t v100 = v198->location;
        v101 = [[SGPlainTextContentCursor alloc] initWithMailMessage:v193];
        [(SGPlainTextContentCursor *)v101 setPos:v198->location];
        if ([(SGPlainTextContentCursor *)v101 pos])
        {
          v102 = [v193 textContent];
          BOOL v103 = objc_msgSend(v102, "characterAtIndex:", -[SGPlainTextContentCursor pos](v101, "pos")) == 10;

          if (!v103)
          {
            [(SGPlainTextContentCursor *)v101 backwardWhile:&__block_literal_global_99];
            unint64_t v100 = [(SGPlainTextContentCursor *)v101 pos];
          }
        }
        uint64_t v104 = [(SGPlainTextContentCursor *)v101 pos];
        [(SGPlainTextContentCursor *)v101 backwardWhile:&__block_literal_global_101_22967];
        if ([(SGPlainTextContentCursor *)v101 pos]) {
          unint64_t v105 = [(SGPlainTextContentCursor *)v101 pos] + 1;
        }
        else {
          unint64_t v105 = 1;
        }
        v107 = [v193 textContent];
        unint64_t v108 = [v107 length];

        if (v105 >= v108) {
          unint64_t v105 = v108;
        }
        [(SGPlainTextContentCursor *)v101 setPos:v104];
        [(SGPlainTextContentCursor *)v101 backwardToString:@"\n\n" consume:1];
        v109 = [v193 textContent];
        BOOL v110 = -[SGSignatureDissector _paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:](self, "_paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:", v109, [(SGPlainTextContentCursor *)v101 pos], v104 - [(SGPlainTextContentCursor *)v101 pos], 4, 125);

        if (v110) {
          [(SGPlainTextContentCursor *)v101 setPos:v104];
        }
        if ([(SGPlainTextContentCursor *)v101 pos] == v100)
        {
          if (!v110) {
            unint64_t v100 = 0;
          }
        }
        else
        {
          [(SGPlainTextContentCursor *)v101 backwardWhile:&__block_literal_global_103];
          unint64_t v100 = [(SGPlainTextContentCursor *)v101 pos];
          [(SGPlainTextContentCursor *)v101 backwardToString:@"\n\n" consume:0];
          v111 = [v193 textContent];
          BOOL v112 = -[SGSignatureDissector _paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:](self, "_paragraphWithContent:range:exceedsLineLimit:orCharacterLimit:", v111, [(SGPlainTextContentCursor *)v101 pos], v100 - [(SGPlainTextContentCursor *)v101 pos], 2, 75);

          if (!v112) {
            unint64_t v100 = [(SGPlainTextContentCursor *)v101 pos];
          }
        }
        if (v100 <= v105) {
          unint64_t v100 = v105;
        }
        [(SGPlainTextContentCursor *)v101 setPos:v100];
        [(SGPlainTextContentCursor *)v101 forwardWhile:&__block_literal_global_105];
        uint64_t v113 = [(SGPlainTextContentCursor *)v101 pos];
        NSUInteger v114 = v198->length;
        if (v113 - v100 >= v198->location - v100 + v114) {
          unint64_t v115 = v198->location - v100 + v114;
        }
        else {
          unint64_t v115 = v113 - v100;
        }
        uint64_t v117 = -[SGSignatureDissector rangeOfSenderName:inRange:restrictLength:forMessage:](self, "rangeOfSenderName:inRange:restrictLength:forMessage:", obj, v100, v115, 0, v193);
        if (v117 == 0x7FFFFFFFFFFFFFFFLL)
        {
          v118 = [v193 author];
          v119 = objc_msgSend(v118, "sg_emailAddress");
          BOOL v120 = v119 == 0;

          if (v120) {
            goto LABEL_125;
          }
          v121 = [v193 textContent];
          v122 = [v193 author];
          v123 = objc_msgSend(v122, "sg_emailAddress");
          BOOL v124 = objc_msgSend(v121, "rangeOfString:options:range:", v123, 1, v100, v115) == 0x7FFFFFFFFFFFFFFFLL;

          if (v124)
          {
LABEL_125:
            v125 = sgLogHandle();
            if (os_log_type_enabled(v125, OS_LOG_TYPE_DEBUG))
            {
              *(_WORD *)v206 = 0;
              _os_log_debug_impl(&dword_1CA650000, v125, OS_LOG_TYPE_DEBUG, "Ignoring signature: No sender's name or email.", v206, 2u);
            }
            goto LABEL_127;
          }
        }
        else
        {
          uint64_t v126 = v116;
          v190 = (void *)MEMORY[0x1CB79B230]();
          unint64_t v192 = v117 + v100;
          -[SGPlainTextContentCursor setPos:](v101, "setPos:");
          long long v223 = 0u;
          long long v224 = 0u;
          long long v221 = 0u;
          long long v222 = 0u;
          v127 = [v193 plainTextDetectedData];
          uint64_t v128 = [v127 countByEnumeratingWithState:&v221 objects:v243 count:16];
          if (v128)
          {
            uint64_t v129 = *(void *)v222;
            do
            {
              for (uint64_t i = 0; i != v128; ++i)
              {
                if (*(void *)v222 != v129) {
                  objc_enumerationMutation(v127);
                }
                v131 = *(void **)(*((void *)&v221 + 1) + 8 * i);
                unint64_t v132 = [v131 range];
                if (v132 > [(SGPlainTextContentCursor *)v101 pos])
                {
                  unint64_t v133 = [v131 range];
                  if (v133 >= v198->location && v133 - v198->location < v198->length)
                  {
                    int v135 = 1;
                    goto LABEL_142;
                  }
                }
              }
              uint64_t v128 = [v127 countByEnumeratingWithState:&v221 objects:v243 count:16];
            }
            while (v128);
          }
          int v135 = 0;
LABEL_142:

          v136 = [v193 textContent];
          uint64_t v137 = v192 + v126;
          if (v192 + v126 == [v136 length])
          {
            BOOL v138 = 1;
          }
          else
          {
            uint64_t v139 = [obj length];
            v140 = [v193 textContent];
            if (v139 + v192 >= [v140 length])
            {
              BOOL v138 = 1;
            }
            else
            {
              v141 = [v193 textContent];
              if ([v141 characterAtIndex:v137] == 10)
              {
                BOOL v138 = 1;
              }
              else
              {
                v143 = [v193 textContent];
                v144 = [obj stringByAppendingString:@"\n"];
                v145 = [v193 textContent];
                v184 = v141;
                v146 = v143;
                BOOL v138 = objc_msgSend(v143, "rangeOfString:options:range:", v144, 1, v192, objc_msgSend(v145, "length") - v192) == v192;

                v141 = v184;
              }
            }
          }

          uint64_t v147 = [(SGPlainTextContentCursor *)v101 pos];
          [(SGPlainTextContentCursor *)v101 forwardWhile:&__block_literal_global_108];
          if ((v135 | v138) == 1 && [(SGPlainTextContentCursor *)v101 pos] > v100)
          {
            uint64_t v148 = [(SGPlainTextContentCursor *)v101 pos];
            NSUInteger v149 = v115 + v100 - v147;
            if (v149 >= v148 - v147) {
              NSUInteger v149 = v148 - v147;
            }
            v198->NSUInteger location = v147;
            v198->NSUInteger length = v149;
          }
        }
        if (v198->location == location && v198->length == length) {
          goto LABEL_170;
        }
        v150 = (void *)MEMORY[0x1CB79B230]();
        NSUInteger v151 = v198->location;
        NSUInteger v152 = v198->length;
        v153 = (void *)MEMORY[0x1CB79B230]();
        v154 = patterns_22951();
        v155 = [v154 regex2ForKey:@"InhumanSig"];
        v156 = objc_msgSend(v185, "substringWithRange:", v151, v152);
        v157 = [v155 existsInString:v156];

        id v158 = v157;

        if (v158)
        {
          v159 = sgLogHandle();
          if (os_log_type_enabled(v159, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1CA650000, v159, OS_LOG_TYPE_DEBUG, "Tagging as inhuman after adjusting range: Signature pattern", v206, 2u);
          }

          v160 = sgLogHandle();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1CA650000, v160, OS_LOG_TYPE_DEBUG, "Ignoring signature after adjusting range: Inhuman pattern.", v206, 2u);
          }

          BOOL *v186 = 1;
        }
        if (!v158)
        {
LABEL_170:
          long long v219 = 0u;
          long long v220 = 0u;
          long long v217 = 0u;
          long long v218 = 0u;
          v125 = [v193 plainTextDetectedData];
          uint64_t v161 = [v125 countByEnumeratingWithState:&v217 objects:v242 count:16];
          if (!v161)
          {
LABEL_179:

            v165 = [(SGSignatureDissector *)self findRejectSig:v193];
            long long v215 = 0u;
            long long v216 = 0u;
            long long v213 = 0u;
            long long v214 = 0u;
            v125 = v165;
            uint64_t v166 = [v125 countByEnumeratingWithState:&v213 objects:v241 count:16];
            if (v166)
            {
              uint64_t v167 = *(void *)v214;
              while (2)
              {
                for (uint64_t j = 0; j != v166; ++j)
                {
                  if (*(void *)v214 != v167) {
                    objc_enumerationMutation(v125);
                  }
                  v248.NSUInteger location = [*(id *)(*((void *)&v213 + 1) + 8 * j) rangeValue];
                  if (NSIntersectionRange(v248, *v198).length)
                  {
                    v177 = sgLogHandle();
                    if (os_log_type_enabled(v177, OS_LOG_TYPE_DEBUG))
                    {
                      *(_WORD *)v206 = 0;
                      _os_log_debug_impl(&dword_1CA650000, v177, OS_LOG_TYPE_DEBUG, "Ignoring signature: Anti pattern.", v206, 2u);
                    }
                    BOOL v13 = 1;
                    v182 = v125;
                    goto LABEL_195;
                  }
                }
                uint64_t v166 = [v125 countByEnumeratingWithState:&v213 objects:v241 count:16];
                if (v166) {
                  continue;
                }
                break;
              }
            }

            v169 = +[SGIdentityName nameWithString:obj];
            v170 = objc_opt_new();
            NSUInteger v171 = v198->location;
            NSUInteger v172 = v198->length;
            v173 = [v193 textContent];
            uint64_t v174 = [v173 length];
            NSUInteger v175 = v198->location;
            NSUInteger v176 = v198->length;

            v177 = objc_msgSend(objc_alloc(MEMORY[0x1E4F28E60]), "initWithIndexesInRange:", v172 + v171, v174 - (v175 + v176));
            v178 = [v193 quotedRegions];
            [v177 removeIndexes:v178];

            v210[0] = MEMORY[0x1E4F143A8];
            v210[1] = 3221225472;
            v210[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_109;
            v210[3] = &unk_1E65C0208;
            id v179 = v170;
            id v211 = v179;
            id v212 = v193;
            [v177 enumerateRangesUsingBlock:v210];
            v180 = objc_msgSend(NSString, "_pas_proxyStringByConcatenatingStrings:", v179);

            *(void *)v206 = 0;
            v207 = v206;
            uint64_t v208 = 0x2020000000;
            char v209 = 0;
            uint64_t v181 = [v180 length];
            v201[0] = MEMORY[0x1E4F143A8];
            v201[1] = 3221225472;
            v201[2] = __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2_110;
            v201[3] = &unk_1E65B9B68;
            v202 = obj;
            v203 = self;
            v182 = v169;
            v204 = v182;
            v205 = v206;
            objc_msgSend(v180, "enumerateSubstringsInRange:options:usingBlock:", 0, v181, 256, v201);
            BOOL v13 = v207[24] != 0;
            if (!v207[24])
            {
              v183 = sgLogHandle();
              if (os_log_type_enabled(v183, OS_LOG_TYPE_DEBUG))
              {
                *(_WORD *)v200 = 0;
                _os_log_debug_impl(&dword_1CA650000, v183, OS_LOG_TYPE_DEBUG, "Not ignoring signature.", v200, 2u);
              }
            }
            _Block_object_dispose(v206, 8);

LABEL_195:
            goto LABEL_196;
          }
          uint64_t v162 = 0;
          uint64_t v163 = *(void *)v218;
LABEL_172:
          uint64_t v164 = 0;
          while (1)
          {
            if (*(void *)v218 != v163) {
              objc_enumerationMutation(v125);
            }
            if ([*(id *)(*((void *)&v217 + 1) + 8 * v164) matchType] == 2
              && (unint64_t)++v162 > 3)
            {
              break;
            }
            if (v161 == ++v164)
            {
              uint64_t v161 = [v125 countByEnumeratingWithState:&v217 objects:v242 count:16];
              if (v161) {
                goto LABEL_172;
              }
              goto LABEL_179;
            }
          }
LABEL_127:
          BOOL v13 = 1;
LABEL_196:

          goto LABEL_197;
        }
      }
      BOOL v13 = 1;
LABEL_197:

      goto LABEL_198;
    }
    v40 = [v187 familyName];
    if (v40)
    {
      v41 = [v187 formattedName];
      BOOL v42 = v41 == 0;

      if (v42) {
        goto LABEL_44;
      }
      if (v39 >= 0x14) {
        uint64_t v43 = 20;
      }
      else {
        uint64_t v43 = v39;
      }
      if (v39 >= 0x14) {
        unint64_t v44 = v39 - 20;
      }
      else {
        unint64_t v44 = 0;
      }
      v45 = [v193 textContent];
      v46 = [v187 formattedName];
      NSUInteger v47 = v38 + v43;
      BOOL v48 = objc_msgSend(v45, "rangeOfString:options:range:", v46, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

      if (v48)
      {
        id v49 = [NSString alloc];
        v50 = [v187 givenName];
        v51 = [v187 familyName];
        obuint64_t j = [v49 initWithFormat:@"%@ %@", v50, v51];

        v52 = [v193 textContent];
        BOOL v53 = objc_msgSend(v52, "rangeOfString:options:range:", obj, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

        if (v53)
        {
          id v54 = [NSString alloc];
          v55 = [v187 familyName];
          v56 = [v187 givenName];
          v57 = (void *)[v54 initWithFormat:@"%@ %@", v55, v56];

          v58 = [v193 textContent];
          BOOL v59 = objc_msgSend(v58, "rangeOfString:options:range:", v57, 0, v44, v47) == 0x7FFFFFFFFFFFFFFFLL;

          if (v59)
          {

            goto LABEL_43;
          }
          v142 = sgLogHandle();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1CA650000, v142, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (last first).", v206, 2u);
          }
        }
        else
        {
          v106 = sgLogHandle();
          if (os_log_type_enabled(v106, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v206 = 0;
            _os_log_debug_impl(&dword_1CA650000, v106, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (first last).", v206, 2u);
          }
        }
      }
      else
      {
        obuint64_t j = sgLogHandle();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)v206 = 0;
          _os_log_debug_impl(&dword_1CA650000, obj, OS_LOG_TYPE_DEBUG, "Ignoring signature: Recipient's name (composite).", v206, 2u);
        }
      }
LABEL_150:
      BOOL v13 = 1;
LABEL_198:

      v61 = v187;
LABEL_199:

      goto LABEL_200;
    }
LABEL_43:

    goto LABEL_44;
  }
  v8 = sgLogHandle();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA650000, v8, OS_LOG_TYPE_DEFAULT, "Can't meaningfully call shouldIgnoreSignature on an entity with no detected signature.", buf, 2u);
  }
LABEL_12:

  BOOL v13 = 1;
LABEL_13:

  return v13;
}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke(uint64_t a1, unint64_t a2, size_t size)
{
  unint64_t v5 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24);
  uint64_t v6 = a2 - v5;
  if (a2 > v5)
  {
    id v7 = *(void **)(a1 + 32);
    v8 = [*(id *)(a1 + 40) textContent];
    v9 = objc_msgSend(v8, "substringWithRange:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), v6);
    [v7 addObject:v9];

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += v6;
  }
  unint64_t v10 = malloc_type_calloc(1uLL, size, 0x26A8E209uLL);
  if (!v10)
  {
    id v12 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v12);
  }
  uint64_t v11 = [[NSString alloc] initWithBytesNoCopy:v10 length:size encoding:1 freeWhenDone:1];
  if (!v11) {
    __assert_rtn("-[SGSignatureDissector shouldIgnoreSignature:signatureRange:isInhuman:]_block_invoke", "SGSignatureDissector.m", 989, "sub != nil");
  }
  id v13 = (id)v11;
  [*(id *)(a1 + 32) addObject:v11];
  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [v13 length];
}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_109(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = *(void **)(a1 + 32);
  id v7 = (void *)MEMORY[0x1CB79B230]();
  v8 = [*(id *)(a1 + 40) textContent];
  objc_msgSend(v8, "substringWithRange:", a2, a3);
  id v9 = (id)objc_claimAutoreleasedReturnValue();

  [v6 addObject:v9];
}

void __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2_110(uint64_t a1, void *a2, uint64_t a3, unint64_t a4, uint64_t a5, uint64_t a6, unsigned char *a7)
{
  id v10 = a2;
  if (a4 && a4 <= 2 * [*(id *)(a1 + 32) length])
  {
    uint64_t v11 = (void *)MEMORY[0x1CB79B230]();
    id v12 = [(id)objc_opt_class() singleLineSignatureLeadingCharacterSet];
    id v13 = [v10 stringByTrimmingCharactersInSet:v12];

    v14 = [*(id *)(a1 + 48) firstname];
    if ([v13 caseInsensitiveCompare:v14])
    {
      v15 = [*(id *)(a1 + 48) surname];
      if ([v13 caseInsensitiveCompare:v15])
      {
        BOOL v16 = +[SGNames unnormalizedNamesApproximatelyMatch:*(void *)(a1 + 32) and:v13];

        if (!v16)
        {
LABEL_12:

          goto LABEL_13;
        }
LABEL_9:
        id v17 = sgLogHandle();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)unint64_t v18 = 0;
          _os_log_debug_impl(&dword_1CA650000, v17, OS_LOG_TYPE_DEBUG, "Ignoring signature: Sender's name after sig.", v18, 2u);
        }

        *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = 1;
        *a7 = 1;
        goto LABEL_12;
      }
    }
    goto LABEL_9;
  }
LABEL_13:
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_106(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_4(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_3(uint64_t a1, int a2, int a3)
{
  if (a2 == 10) {
    return a3 ^ 1u;
  }
  else {
    return 0;
  }
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_2(uint64_t a1, uint64_t a2, int a3)
{
  return a3 ^ 1u;
}

uint64_t __71__SGSignatureDissector_shouldIgnoreSignature_signatureRange_isInhuman___block_invoke_97(uint64_t a1, int a2, int a3)
{
  if (a2 == 10) {
    return 0;
  }
  else {
    return a3 ^ 1u;
  }
}

- (BOOL)_paragraphWithContent:(id)a3 range:(_NSRange)a4 exceedsLineLimit:(unint64_t)a5 orCharacterLimit:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v10 = a3;
  if (length <= a6)
  {
    if (!length)
    {
LABEL_8:
      BOOL v11 = 0;
      goto LABEL_9;
    }
    uint64_t v12 = 0;
    while ([v10 characterAtIndex:location] != 10 || ++v12 <= a5)
    {
      ++location;
      if (!--length) {
        goto LABEL_8;
      }
    }
  }
  BOOL v11 = 1;
LABEL_9:

  return v11;
}

- (void)dissectMailMessage:(id)a3 entity:(id)a4 context:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v12 = [v8 textContent];
  uint64_t v13 = [v12 length];

  if (!v13) {
    goto LABEL_27;
  }
  if (([MEMORY[0x1E4F5DAF0] detectContacts] & 1) == 0)
  {
    v19 = sgLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
LABEL_26:

      goto LABEL_27;
    }
    *(_WORD *)buf = 0;
    v20 = "Skipping signature dissector: detectContacts is OFF";
LABEL_29:
    _os_log_debug_impl(&dword_1CA650000, v19, OS_LOG_TYPE_DEBUG, v20, buf, 2u);
    goto LABEL_26;
  }
  long long v33 = 0uLL;
  [v9 releaseDissectorLock];
  if ([(NSNumber *)self->_ignoreDataDetectorsForTesting BOOLValue]
    || [v8 detectedDataSignatureRange] == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v14 = [(SGSignatureDissector *)self signatureRange:v8];
    *(void *)&long long v33 = v14;
    *((void *)&v33 + 1) = v15;
    if (v14 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = v14;
      uint64_t v17 = v15;
      unint64_t v18 = sgLogHandle();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        _os_log_debug_impl(&dword_1CA650000, v18, OS_LOG_TYPE_DEBUG, "Signature found by alternative algorithms.", buf, 2u);
      }

      goto LABEL_18;
    }
  }
  else
  {
    v21 = sgLogHandle();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v21, OS_LOG_TYPE_DEBUG, "Signature found by DataDetectors.", buf, 2u);
    }

    uint64_t v22 = [v8 detectedDataSignatureRange];
    *(void *)&long long v33 = v22;
    *((void *)&v33 + 1) = v23;
    if (v22 != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v16 = v22;
      uint64_t v17 = v23;
LABEL_18:
      v25 = (void *)MEMORY[0x1CB79B230]();
      v26 = sgLogHandle();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v31 = v17 + v16;
        v29 = [v8 textContent];
        v30 = objc_msgSend(v29, "substringWithRange:", v16, v17);
        *(_DWORD *)buf = 134218498;
        uint64_t v35 = v16;
        __int16 v36 = 2048;
        uint64_t v37 = v31;
        __int16 v38 = 2112;
        unint64_t v39 = v30;
        _os_log_debug_impl(&dword_1CA650000, v26, OS_LOG_TYPE_DEBUG, "Sig range %lu-%lu (%@)", buf, 0x20u);
      }
      char v32 = 0;
      if ([(SGSignatureDissector *)self shouldIgnoreSignature:v8 signatureRange:&v33 isInhuman:&v32])
      {
        long long v33 = xmmword_1CA8CB4A0;
      }
      goto LABEL_22;
    }
  }
  v24 = sgLogHandle();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_debug_impl(&dword_1CA650000, v24, OS_LOG_TYPE_DEBUG, "No signature found", buf, 2u);
  }

  char v32 = 0;
LABEL_22:
  [v9 acquireDissectorLock];
  [v9 setPlainTextSigRange:v33];
  if (v32)
  {
    v27 = sgLogHandle();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1CA650000, v27, OS_LOG_TYPE_DEBUG, "Tagging as inhuman after adjusting range: Signature pattern", buf, 2u);
    }

    v28 = [MEMORY[0x1E4F5D9F0] inhuman];
    [v9 addTag:v28];

    v19 = sgLogHandle();
    if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_26;
    }
    *(_WORD *)buf = 0;
    v20 = "Ignoring signature after adjusting range: Inhuman pattern.";
    goto LABEL_29;
  }
LABEL_27:
}

- (_NSRange)rangeOfSenderNameComponents:(id)a3 withFullname:(id)a4 inSubstring:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  long long v25 = 0u;
  long long v26 = 0u;
  if (+[SGNames isProbablyShortCJKName:a4]) {
    unint64_t v9 = 1;
  }
  else {
    unint64_t v9 = 3;
  }
  long long v27 = 0uLL;
  long long v28 = 0uLL;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v26;
    unint64_t v24 = v9;
LABEL_6:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v26 != v13) {
        objc_enumerationMutation(v10);
      }
      uint64_t v15 = *(void **)(*((void *)&v25 + 1) + 8 * v14);
      if ([v15 length] >= v9)
      {
        unint64_t v16 = [v8 rangeOfString:v15 options:1];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v18 = v16;
          NSUInteger v19 = v17;
          if (v16 < 4) {
            break;
          }
          unint64_t v20 = 0;
          unint64_t v21 = v16 - 1;
          do
          {
            if (!v21) {
              break;
            }
            if ([v8 characterAtIndex:v21] == 10) {
              goto LABEL_21;
            }
            --v21;
            ++v20;
          }
          while (v20 < 3);
          unint64_t v9 = v24;
          if ([v8 characterAtIndex:v18 - 1] == 32) {
            break;
          }
        }
      }
      if (++v14 == v12)
      {
        uint64_t v12 = [v10 countByEnumeratingWithState:&v25 objects:v29 count:16];
        NSUInteger v19 = 0;
        uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
        if (v12) {
          goto LABEL_6;
        }
        break;
      }
    }
  }
  else
  {
    NSUInteger v19 = 0;
    uint64_t v18 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_21:

  NSUInteger v22 = v18;
  NSUInteger v23 = v19;
  result.NSUInteger length = v23;
  result.NSUInteger location = v22;
  return result;
}

- (_NSRange)rangeOfSenderName:(id)a3 inRange:(_NSRange)a4 restrictLength:(BOOL)a5 forMessage:(id)a6
{
  BOOL v7 = a5;
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a6;
  uint64_t v13 = (void *)MEMORY[0x1CB79B230]();
  uint64_t v14 = [v12 textContent];
  uint64_t v15 = objc_msgSend(v14, "substringWithRange:", location, length);

  if (!v7) {
    goto LABEL_4;
  }
  unint64_t v16 = (void *)MEMORY[0x1CB79B230]();
  NSUInteger v17 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:@"-_ "];
  uint64_t v18 = [v15 stringByTrimmingCharactersInSet:v17];

  unint64_t v19 = [v18 length];

  if (v19 > 0x96)
  {
    NSUInteger v20 = 0;
    uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
LABEL_4:
    NSUInteger v22 = +[SGNames stripHonorifics:v11];
    NSUInteger v23 = +[SGIdentityName nameWithString:v22];
    unint64_t v24 = objc_opt_new();
    long long v25 = [v23 firstname];

    if (v25)
    {
      long long v26 = (void *)MEMORY[0x1CB79B230]();
      long long v27 = [v23 firstname];
      long long v28 = [v27 componentsSeparatedByString:@" "];

      [v24 addObjectsFromArray:v28];
    }
    v29 = [v23 surname];

    if (v29)
    {
      uint64_t v30 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v31 = [v23 surname];
      char v32 = [v31 componentsSeparatedByString:@" "];

      [v24 addObjectsFromArray:v32];
    }
    long long v33 = [v23 middlename];

    if (v33)
    {
      NSUInteger v34 = (void *)MEMORY[0x1CB79B230]();
      uint64_t v35 = [v23 middlename];
      __int16 v36 = [v35 componentsSeparatedByString:@" "];

      [v24 addObjectsFromArray:v36];
    }
    uint64_t v37 = [(SGSignatureDissector *)self rangeOfSenderNameComponents:v24 withFullname:v22 inSubstring:v15];
    NSUInteger v20 = v38;
    if (v37 == 0x7FFFFFFFFFFFFFFFLL)
    {
      unint64_t v39 = [v23 firstname];

      if (v39)
      {
        uint64_t v40 = [v23 firstname];
        v41 = +[SGNicknames nicknamesForName:v40];

        uint64_t v42 = [v41 allObjects];
        uint64_t v43 = self;
        unint64_t v44 = (void *)v42;
        uint64_t v21 = [(SGSignatureDissector *)v43 rangeOfSenderNameComponents:v42 withFullname:v22 inSubstring:v15];
        NSUInteger v20 = v45;
      }
      else
      {
        uint64_t v21 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
    else
    {
      uint64_t v21 = v37;
    }
  }
  NSUInteger v46 = v21;
  NSUInteger v47 = v20;
  result.NSUInteger length = v47;
  result.NSUInteger location = v46;
  return result;
}

- (id)authorFirstname:(id)a3
{
  uint64_t v3 = [(SGSignatureDissector *)self authorName:a3];
  if (v3)
  {
    v4 = +[SGIdentityName nameWithString:v3];
    unint64_t v5 = [v4 firstname];
    if ([v5 length])
    {
      id v6 = [v4 firstname];
    }
    else
    {
      id v6 = v3;
    }
    BOOL v7 = v6;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (id)authorName:(id)a3
{
  uint64_t v3 = [a3 author];
  v4 = [v3 displayName];

  return v4;
}

- (_NSRange)trailingSenderNameLineRange:(id)a3
{
  v46[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v39 = self;
  uint64_t v40 = [(SGSignatureDissector *)self authorName:v4];
  if (![v40 length]) {
    goto LABEL_10;
  }
  unint64_t v5 = (void *)MEMORY[0x1CB79B230]();
  id v6 = [[SGPlainTextContentCursor alloc] initWithMailMessage:v4];
  [(SGPlainTextContentCursor *)v6 seekToEnd];
  [(SGPlainTextContentCursor *)v6 backwardWhile:&__block_literal_global_67_23027];
  uint64_t v7 = [(SGPlainTextContentCursor *)v6 pos];
  [(SGPlainTextContentCursor *)v6 backwardToString:@"\n\n" consume:0];
  if ([(SGPlainTextContentCursor *)v6 pos] == v7) {
    [(SGPlainTextContentCursor *)v6 backwardWhile:&__block_literal_global_72_23028];
  }
  if ([(SGPlainTextContentCursor *)v6 pos] == v7) {
    goto LABEL_9;
  }
  uint64_t v8 = [(SGPlainTextContentCursor *)v6 pos];
  unint64_t v9 = [v4 textContent];
  int v10 = [v9 characterAtIndex:v7];

  if (v10 == 65306 || v10 == 58)
  {
    [(SGPlainTextContentCursor *)v6 backward];
    [(SGPlainTextContentCursor *)v6 backwardWhile:&__block_literal_global_74];
    uint64_t v7 = [(SGPlainTextContentCursor *)v6 pos];
    [(SGPlainTextContentCursor *)v6 backwardToString:@"\n\n" consume:0];
    uint64_t v8 = [(SGPlainTextContentCursor *)v6 pos];
  }
  uint64_t v11 = v7 - v8;
  if (v7 == v8)
  {
LABEL_9:

LABEL_10:
    NSUInteger v12 = 0;
    uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_11;
  }
  [(SGPlainTextContentCursor *)v6 backward];
  [(SGPlainTextContentCursor *)v6 backwardWhile:&__block_literal_global_76];
  uint64_t v16 = [(SGPlainTextContentCursor *)v6 pos];
  [(SGPlainTextContentCursor *)v6 backwardToString:@"\n" consume:0];
  uint64_t v17 = [(SGPlainTextContentCursor *)v6 pos];
  context = v5;
  id v38 = v4;
  if ([(SGPlainTextContentCursor *)v6 pos] < 2) {
    goto LABEL_17;
  }
  uint64_t v18 = objc_msgSend(v4, "textContent", v5);
  if (objc_msgSend(v18, "characterAtIndex:", -[SGPlainTextContentCursor pos](v6, "pos") - 1) != 10)
  {

    goto LABEL_17;
  }
  unint64_t v19 = [v4 textContent];
  int v20 = objc_msgSend(v19, "characterAtIndex:", -[SGPlainTextContentCursor pos](v6, "pos") - 2);

  if (v20 != 10)
  {
LABEL_17:
    uint64_t v21 = 0;
    goto LABEL_18;
  }
  uint64_t v21 = v16 - v17 + 1;
LABEL_18:
  NSUInteger v22 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v8, v11 + 1, context);
  v46[0] = v22;
  NSUInteger v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:1];
  unint64_t v24 = (void *)[v23 mutableCopy];

  if (v21)
  {
    long long v25 = (void *)MEMORY[0x1CB79B230]();
    long long v26 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v17, v21);
    [v24 addObject:v26];
  }
  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id v27 = v24;
  uint64_t v28 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v42;
    while (2)
    {
      for (uint64_t i = 0; i != v29; ++i)
      {
        if (*(void *)v42 != v30) {
          objc_enumerationMutation(v27);
        }
        char v32 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        long long v33 = (void *)MEMORY[0x1CB79B230]();
        uint64_t v13 = [v32 rangeValue];
        NSUInteger v12 = v34;
        uint64_t v35 = -[SGSignatureDissector rangeOfSenderName:inRange:restrictLength:forMessage:](v39, "rangeOfSenderName:inRange:restrictLength:forMessage:", v40, v13, v34, 1, v38);
        if (v35 != 0x7FFFFFFFFFFFFFFFLL)
        {

          goto LABEL_30;
        }
      }
      uint64_t v29 = [v27 countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v29) {
        continue;
      }
      break;
    }
  }

  NSUInteger v12 = 0;
  uint64_t v13 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_30:
  id v4 = v38;
LABEL_11:

  NSUInteger v14 = v13;
  NSUInteger v15 = v12;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_4(uint64_t a1, int a2)
{
  return a2 == 10;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_3(uint64_t a1, int a2)
{
  return a2 == 10;
}

BOOL __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke_2(uint64_t a1, int a2)
{
  return a2 != 10;
}

uint64_t __52__SGSignatureDissector_trailingSenderNameLineRange___block_invoke(uint64_t a1, int a2, unsigned int a3)
{
  if (a2 == 10) {
    return 1;
  }
  else {
    return a3;
  }
}

- (_NSRange)miniSignatureRange:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSignatureDissector *)self trailingSenderNameLineRange:v4];
  if (v6)
  {
    unint64_t v7 = v5;
    NSUInteger v8 = v6;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    unint64_t v9 = objc_msgSend(v4, "plainTextDetectedData", 0);
    uint64_t v10 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v9);
          }
          NSUInteger v14 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          unint64_t v15 = [v14 range];
          if (v15 >= v7 && v15 - v7 < v8)
          {
            unsigned int v17 = [v14 matchType];
            if (v17 <= 5 && v17 != 4)
            {
              uint64_t v19 = v7;
              NSUInteger v20 = v8;
              goto LABEL_21;
            }
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v23 objects:v27 count:16];
        NSUInteger v20 = 0;
        uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
      }
      while (v11);
    }
    else
    {
      NSUInteger v20 = 0;
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
LABEL_21:
  }
  else
  {
    NSUInteger v20 = 0;
    uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v21 = v19;
  NSUInteger v22 = v20;
  result.NSUInteger length = v22;
  result.NSUInteger location = v21;
  return result;
}

- (_NSRange)hmmSignatureRangeWithContent:(id)a3 detectedData:(id)a4 quotedRegions:(id)a5 authorName:(id)a6
{
  uint64_t v129 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  NSUInteger v14 = v13;
  if (!v10)
  {
    NSUInteger v53 = 0;
    uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_93;
  }
  uint64_t v104 = v13;
  id v105 = v12;
  id v103 = v10;
  v106 = _PASTrimTrailingWhitespace();
  unint64_t v15 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:16];
  long long v122 = 0u;
  long long v123 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  id v102 = v11;
  id v16 = v11;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v122 objects:v128 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v123;
LABEL_4:
    uint64_t v20 = 0;
    while (2)
    {
      if (*(void *)v123 != v19) {
        objc_enumerationMutation(v16);
      }
      NSUInteger v21 = *(void **)(*((void *)&v122 + 1) + 8 * v20);
      uint64_t v22 = 0;
      switch([v21 matchType])
      {
        case 0u:
          uint64_t v22 = 2;
          goto LABEL_12;
        case 1u:
          uint64_t v22 = 1;
          goto LABEL_12;
        case 3u:
          uint64_t v22 = 4;
          goto LABEL_12;
        case 4u:
        case 6u:
        case 7u:
        case 8u:
        case 9u:
          goto LABEL_13;
        case 5u:
          uint64_t v22 = 3;
          goto LABEL_12;
        default:
LABEL_12:
          uint64_t v23 = [v21 range];
          unint64_t v6 = v22 | v6 & 0xFFFFFFFF00000000;
          long long v25 = +[SGSlice sliceWithType:range:](SGSlice, "sliceWithType:range:", v6, v23, v24);
          [v15 addObject:v25];

LABEL_13:
          if (v18 != ++v20) {
            continue;
          }
          uint64_t v18 = [v16 countByEnumeratingWithState:&v122 objects:v128 count:16];
          if (!v18) {
            goto LABEL_15;
          }
          goto LABEL_4;
      }
    }
  }
LABEL_15:

  v120[0] = MEMORY[0x1E4F143A8];
  v120[1] = 3221225472;
  v120[2] = __91__SGSignatureDissector_hmmSignatureRangeWithContent_detectedData_quotedRegions_authorName___block_invoke;
  v120[3] = &unk_1E65BED98;
  id v26 = v15;
  id v121 = v26;
  [v12 enumerateRangesUsingBlock:v120];
  id v27 = objc_opt_new();
  v107 = v26;
  uint64_t v28 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v26, "count"));
  uint64_t v29 = 0;
  do
  {
    uint64_t v108 = v29;
    int v30 = slicePrecedence[v29];
    long long v118 = 0u;
    long long v119 = 0u;
    long long v116 = 0u;
    long long v117 = 0u;
    id v31 = v107;
    uint64_t v32 = [v31 countByEnumeratingWithState:&v116 objects:v127 count:16];
    if (v32)
    {
      uint64_t v33 = v32;
      uint64_t v34 = *(void *)v117;
      do
      {
        for (uint64_t i = 0; i != v33; ++i)
        {
          if (*(void *)v117 != v34) {
            objc_enumerationMutation(v31);
          }
          __int16 v36 = *(void **)(*((void *)&v116 + 1) + 8 * i);
          if (v30 == (unsigned __int16)[v36 type])
          {
            uint64_t v37 = [v36 range];
            uint64_t v39 = v38;
            if ((objc_msgSend(v27, "intersectsIndexesInRange:", v37, v38) & 1) == 0)
            {
              objc_msgSend(v27, "addIndexesInRange:", v37, v39);
              [v28 addObject:v36];
            }
          }
        }
        uint64_t v33 = [v31 countByEnumeratingWithState:&v116 objects:v127 count:16];
      }
      while (v33);
    }

    uint64_t v29 = v108 + 1;
  }
  while (v108 != 5);
  id v40 = v28;

  [v40 sortUsingSelector:sel_compare_];
  v114[0] = 0;
  *(_OWORD *)unint64_t v115 = 0u;
  v114[1] = (void *)256;
  long long v41 = malloc_type_malloc(0x100uLL, 0x100004077774924uLL);
  if (!v41) {
    goto LABEL_99;
  }
  v115[0] = v41;
  long long v42 = malloc_type_malloc(0x800uLL, 0x100004000313F17uLL);
  if (!v42) {
    goto LABEL_99;
  }
  v115[1] = v42;
  long long v110 = 0u;
  long long v111 = 0u;
  long long v112 = 0u;
  long long v113 = 0u;
  id v43 = v40;
  uint64_t v44 = [v43 countByEnumeratingWithState:&v110 objects:v126 count:16];
  NSUInteger v14 = v104;
  if (v44)
  {
    uint64_t v45 = v44;
    unint64_t v46 = 0;
    uint64_t v47 = *(void *)v111;
LABEL_31:
    uint64_t v48 = 0;
    while (1)
    {
      if (*(void *)v111 != v47) {
        objc_enumerationMutation(v43);
      }
      id v49 = *(void **)(*((void *)&v110 + 1) + 8 * v48);
      unint64_t v50 = [v49 start];
      if (v50 >= [v106 length]) {
        break;
      }
      if ([v49 start] > v46) {
        tokenize(v106, (uint64_t)v114, v46, [v49 start] - v46, v104);
      }
      unsigned __int16 v51 = [v49 type];
      if (v51 >= 6u) {
        char v52 = 7;
      }
      else {
        char v52 = v51 + 12;
      }
      emitToken(v114, v52, [v49 start]);
      unint64_t v46 = [v49 end];
      if (v45 == ++v48)
      {
        uint64_t v45 = [v43 countByEnumeratingWithState:&v110 objects:v126 count:16];
        if (v45) {
          goto LABEL_31;
        }
        break;
      }
    }
  }
  else
  {
    unint64_t v46 = 0;
  }

  if (v46 < [v106 length]) {
    tokenize(v106, (uint64_t)v114, v46, [v106 length] - v46, v104);
  }
  v55 = (unsigned __int8 *)v115[0];
  size_t v56 = (size_t)v114[0];
  if (viterbi_hmmOnceToken != -1) {
    dispatch_once(&viterbi_hmmOnceToken, &__block_literal_global_240);
  }
  v57 = 0;
  unsigned __int8 v58 = atomic_load(viterbi_hmmLoaded);
  if (!v56 || (v58 & 1) == 0) {
    goto LABEL_67;
  }
  BOOL v59 = (double *)malloc_type_malloc(8 * v56, 0x100004000313F17uLL);
  v60 = (double *)malloc_type_malloc(8 * v56, 0x100004000313F17uLL);
  v61 = (unsigned __int8 *)malloc_type_calloc(v56, 1uLL, 0x100004077774924uLL);
  if (!v61)
  {
LABEL_99:
    id v101 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C4A0] reason:@"malloc failed" userInfo:0];
    objc_exception_throw(v101);
  }
  v62 = v61;
  v57 = 0;
  if (v59 && v60)
  {
    *BOOL v59 = *(double *)&qword_1EB9E6A28 + hmm[*v55];
    double *v60 = *(double *)&qword_1EB9E6A30 + hmm[*v55 + 18];
    unsigned __int8 *v61 = 2;
    if (v56 >= 2)
    {
      double v63 = *(double *)&qword_1EB9E6A08;
      double v64 = unk_1EB9E6A10;
      size_t v65 = v56 - 1;
      double v66 = *(double *)&qword_1EB9E6A18;
      double v67 = unk_1EB9E6A20;
      v68 = v61 + 1;
      v69 = v55 + 1;
      uint64_t v70 = v59;
      uint64_t v71 = v60;
      do
      {
        unsigned int v73 = *v69++;
        uint64_t v72 = v73;
        if (v73 >= 0x13uLL) {
          __assert_rtn("viterbi", "SGSignatureDissector.m", 1413, "obs <= NUM_TOKEN_TYPES");
        }
        double v74 = *v70;
        double v75 = hmm[v72];
        double v76 = v63 + *v70 + v75;
        double v77 = v75 + v66 + *v71;
        if (v77 > v76)
        {
          *v68 |= 1u;
          double v74 = *v70;
          double v76 = v77;
        }
        v70[1] = v76;
        double v78 = hmm[v72 + 18];
        double v79 = v64 + v74 + v78;
        double v80 = v78 + v67 + *v71;
        if (v80 > v79)
        {
          *v68 |= 2u;
          double v79 = v80;
        }
        v71[1] = v79;
        ++v71;
        ++v68;
        ++v70;
        --v65;
      }
      while (v65);
    }
    v81 = malloc_type_malloc(v56, 0x100004077774924uLL);
    v57 = v81;
    if (v81)
    {
      int v82 = v56 - 1;
      if ((int)v56 >= 1)
      {
        LOBYTE(v83) = v60[v56 - 1] > v59[v56 - 1];
        unint64_t v84 = v56 + 1;
        do
        {
          v81[v82] = v83 & 1;
          int v83 = (v62[v82] >> (v83 & 1)) & 1;
          --v84;
          --v82;
        }
        while (v84 > 1);
      }
    }
  }
  free(v59);
  free(v60);
  free(v62);
  NSUInteger v14 = v104;
LABEL_67:
  uint64_t v85 = (char *)v114[0];
  if (!v114[0]) {
    goto LABEL_91;
  }
  uint64_t v86 = 0;
  while (1)
  {
    v87 = (char *)(v86 + 1);
    if (v57[v86]) {
      break;
    }
    ++v86;
    if (v114[0] == v87) {
      goto LABEL_91;
    }
  }
  if (LODWORD(v114[0]) - (int)v86 > 39)
  {
    int v88 = sgLogHandle();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      unint64_t v100 = "HMM confused, too many tokens in signature";
LABEL_97:
      _os_log_debug_impl(&dword_1CA650000, v88, OS_LOG_TYPE_DEBUG, v100, buf, 2u);
    }
    goto LABEL_74;
  }
  if (v114[0] <= (void *)(v86 + 1))
  {
LABEL_84:
    uint64_t v54 = *((unsigned int *)v115[1] + v86);
    uint64_t v93 = objc_msgSend(v106, "rangeOfString:options:range:", @"\n", 6, 0, v54);
    if (!v94) {
      goto LABEL_91;
    }
    if ((unint64_t)(v54 - v93) >= 5)
    {
      uint64_t v95 = objc_msgSend(v106, "rangeOfString:options:range:", @"\n", 2, v54, objc_msgSend(v106, "length") - v54);
      if (v96) {
        uint64_t v54 = v95 + 1;
      }
    }
    uint64_t v97 = [v106 length];
    NSUInteger v53 = v97 - v54;
    if (v97 == v54) {
      uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
    }
    goto LABEL_92;
  }
  unint64_t v89 = 0;
  while (*((unsigned char *)v115[0] + (unint64_t)v87) != 17)
  {
LABEL_83:
    if (v85 <= ++v87) {
      goto LABEL_84;
    }
  }
  uint64_t v90 = *((unsigned int *)v115[1] + (void)v87);
  unint64_t v91 = (v87 + 1);
  if ((unint64_t)v85 <= v91) {
    uint64_t v92 = [v106 length];
  }
  else {
    uint64_t v92 = *((unsigned int *)v115[1] + v91);
  }
  v89 += v92 - v90;
  if (v89 <= 0x100)
  {
    uint64_t v85 = (char *)v114[0];
    goto LABEL_83;
  }
  int v88 = sgLogHandle();
  if (os_log_type_enabled(v88, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    unint64_t v100 = "HMM confused, too much quoting in signature";
    goto LABEL_97;
  }
LABEL_74:

LABEL_91:
  NSUInteger v53 = 0;
  uint64_t v54 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_92:
  free(v57);
  free(v115[0]);
  free(v115[1]);

  id v11 = v102;
  id v10 = v103;
  id v12 = v105;
LABEL_93:

  NSUInteger v98 = v54;
  NSUInteger v99 = v53;
  result.NSUInteger length = v99;
  result.NSUInteger location = v98;
  return result;
}

void __91__SGSignatureDissector_hmmSignatureRangeWithContent_detectedData_quotedRegions_authorName___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void **)(a1 + 32);
  +[SGSlice sliceWithType:range:](SGSlice, "sliceWithType:range:", 5, a2, a3);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  [v3 addObject:v4];
}

- (_NSRange)hmmSignatureRange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 textContent];
  unint64_t v6 = [v4 plainTextDetectedData];
  unint64_t v7 = [v4 quotedRegions];
  NSUInteger v8 = [(SGSignatureDissector *)self authorFirstname:v4];

  uint64_t v9 = [(SGSignatureDissector *)self hmmSignatureRangeWithContent:v5 detectedData:v6 quotedRegions:v7 authorName:v8];
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (_NSRange)hmmPlausibleSignatureRange:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(SGSignatureDissector *)self findValedictionCommencedSignatureRanges:v4];
  unint64_t v6 = [v5 firstObject];
  uint64_t v7 = [v6 rangeValue];
  uint64_t v9 = v8;

  if (v9)
  {
    context = (void *)MEMORY[0x1CB79B230]();
    NSUInteger v10 = [v4 textContent];
    NSUInteger v11 = [v10 substringToIndex:v7 + v9];

    NSUInteger v12 = [v4 quotedRegions];
    int v30 = objc_msgSend(v12, "indexesInRange:options:passingTest:", 0, objc_msgSend(v11, "length"), 0, &__block_literal_global_23074);

    id v13 = objc_alloc(MEMORY[0x1E4F1CA48]);
    NSUInteger v14 = [v4 plainTextDetectedData];
    unint64_t v15 = objc_msgSend(v13, "initWithCapacity:", objc_msgSend(v14, "count"));

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v16 = [v4 plainTextDetectedData];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v33;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v33 != v19) {
            objc_enumerationMutation(v16);
          }
          NSUInteger v21 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          uint64_t v22 = objc_msgSend(v21, "range", v30);
          [v21 range];
          if (v23 + v22 <= (unint64_t)[v11 length]) {
            [v15 addObject:v21];
          }
        }
        uint64_t v18 = [v16 countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v18);
    }

    uint64_t v24 = [(SGSignatureDissector *)self authorFirstname:v4];
    uint64_t v25 = [(SGSignatureDissector *)self hmmSignatureRangeWithContent:v11 detectedData:v15 quotedRegions:v30 authorName:v24];
    NSUInteger v27 = v26;
  }
  else
  {
    NSUInteger v27 = 0;
    uint64_t v25 = 0x7FFFFFFFFFFFFFFFLL;
  }

  NSUInteger v28 = v25;
  NSUInteger v29 = v27;
  result.NSUInteger length = v29;
  result.NSUInteger location = v28;
  return result;
}

uint64_t __51__SGSignatureDissector_hmmPlausibleSignatureRange___block_invoke()
{
  return 1;
}

- (_NSRange)findSignaturePrefix:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SGSignatureDissector *)self findValediction:v4];
  if (v6)
  {
    uint64_t v7 = v5;
    NSUInteger v8 = v6;
  }
  else
  {
    uint64_t v9 = patterns_22951();
    NSUInteger v10 = [v9 regex2ForKey:@"SymbolicSig"];
    NSUInteger v11 = [(SGSignatureDissector *)self findSignaturePrefixesInMessage:v4 withSignaturePrefixes:v10];
    NSUInteger v12 = [v11 firstObject];
    uint64_t v7 = [v12 rangeValue];
    NSUInteger v8 = v13;
  }
  NSUInteger v14 = v7;
  NSUInteger v15 = v8;
  result.NSUInteger length = v15;
  result.NSUInteger location = v14;
  return result;
}

- (id)findRejectSig:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__23080;
  uint64_t v20 = __Block_byref_object_dispose__23081;
  id v21 = 0;
  id v21 = (id)objc_opt_new();
  id v4 = [v3 quotedRegions];
  uint64_t v5 = [v3 textContent];
  if ([v5 length])
  {
    NSUInteger v6 = patterns_22951();
    uint64_t v7 = [v6 regex2ForKey:@"RejetedSig/F"];
    uint64_t v10 = MEMORY[0x1E4F143A8];
    uint64_t v11 = 3221225472;
    NSUInteger v12 = __38__SGSignatureDissector_findRejectSig___block_invoke;
    NSUInteger v13 = &unk_1E65B9AD8;
    id v14 = v4;
    NSUInteger v15 = &v16;
    [v7 enumerateMatchesInString:v5 ngroups:0 block:&v10];
  }
  NSUInteger v8 = objc_msgSend((id)v17[5], "copy", v10, v11, v12, v13);

  _Block_object_dispose(&v16, 8);
  return v8;
}

uint64_t __38__SGSignatureDissector_findRejectSig___block_invoke(uint64_t a1, void *a2)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", *a2, a2[1]) & 1) == 0)
  {
    id v4 = *(void **)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *a2, a2[1]);
    [v4 addObject:v5];
  }
  return 1;
}

- (_NSRange)findValediction:(id)a3
{
  id v4 = a3;
  uint64_t v5 = patterns_22951();
  NSUInteger v6 = [v5 regex2ForKey:@"ValedictionSig/F"];
  uint64_t v7 = [(SGSignatureDissector *)self findSignaturePrefixesInMessage:v4 withSignaturePrefixes:v6];

  NSUInteger v8 = [v7 firstObject];
  uint64_t v9 = [v8 rangeValue];
  NSUInteger v11 = v10;

  NSUInteger v12 = v9;
  NSUInteger v13 = v11;
  result.NSUInteger length = v13;
  result.NSUInteger location = v12;
  return result;
}

- (id)findSignaturePrefixesInMessage:(id)a3 withSignaturePrefixes:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 textContent];
  if (v7)
  {
    NSUInteger v8 = objc_opt_new();
    uint64_t v9 = [v5 quotedRegions];
    id v13 = v7;
    id v14 = v6;
    NSUInteger v15 = v9;
    id v16 = v8;
    id v10 = v9;
    _PASEnumerateSimpleLinesInString();
    id v11 = v16;
  }
  else
  {
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

uint64_t __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6 = objc_msgSend(*(id *)(a1 + 32), "substringWithRange:", a2, a3);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke_2;
  v9[3] = &unk_1E65B9A88;
  uint64_t v12 = a2;
  uint64_t v13 = a3;
  uint64_t v7 = *(void **)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  [v7 enumerateMatchesInString:v6 ngroups:0 block:v9];

  return 1;
}

uint64_t __77__SGSignatureDissector_findSignaturePrefixesInMessage_withSignaturePrefixes___block_invoke_2(uint64_t a1, void *a2)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", *a2 + *(void *)(a1 + 48), a2[1] + 1) & 1) == 0)
  {
    id v4 = *(void **)(a1 + 40);
    id v5 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", *a2 + *(void *)(a1 + 48), a2[1]);
    [v4 addObject:v5];
  }
  return 1;
}

- (id)findValedictionCommencedSignatureRanges:(id)a3
{
  id v3 = a3;
  id v4 = [v3 textContent];
  if (v4)
  {
    id v5 = objc_opt_new();
    id v6 = [v3 quotedRegions];
    id v10 = v4;
    id v11 = v6;
    id v12 = v5;
    id v7 = v6;
    _PASEnumerateSimpleLinesInString();
    id v8 = v12;
  }
  else
  {
    id v8 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v8;
}

uint64_t __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke(int a1, NSRange range1)
{
  NSUInteger length = range1.length;
  id v4 = v3;
  if (range1.location)
  {
    range1.NSUInteger length = range1.location - 1;
    NSUInteger location = range1.location;
    range1.NSUInteger location = length;
    uint64_t v6 = 1;
    NSRange v7 = NSUnionRange(range1, *(NSRange *)&range1.length);
    NSUInteger v8 = v7.location;
    NSUInteger length = v7.length;
  }
  else
  {
    NSUInteger v8 = 0;
  }
  uint64_t v9 = objc_msgSend(v4[4], "substringWithRange:", v8, length);
  id v10 = patterns_22951();
  id v11 = [v10 regex2ForKey:@"RelaxedSig/F"];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke_2;
  v13[3] = &unk_1E65B9A38;
  NSUInteger v17 = v8;
  NSUInteger v18 = length;
  id v14 = v4[5];
  id v15 = v4[4];
  id v16 = v4[6];
  [v11 enumerateMatchesInString:v9 ngroups:0 block:v13];

  return 1;
}

uint64_t __64__SGSignatureDissector_findValedictionCommencedSignatureRanges___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = a2[1];
  uint64_t v4 = *(void *)(a1 + 56) + *a2;
  if (objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", v4, v3)) {
    return 1;
  }
  id v5 = [*(id *)(a1 + 40) substringFromIndex:v4 + v3];
  if ((unint64_t)[v5 length] < 4) {
    goto LABEL_53;
  }
  uint64_t v6 = v5;
  NSRange v7 = self;

  if (!v7) {
    goto LABEL_38;
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  *(_OWORD *)buffer = 0u;
  long long v32 = 0u;
  CFIndex Length = CFStringGetLength(v6);
  CFStringRef theString = v6;
  uint64_t v42 = 0;
  CFIndex v43 = Length;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  CStringPtr = 0;
  id v40 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v6, 0x600u);
  }
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  long long v41 = CStringPtr;
  if (Length < 1)
  {
LABEL_38:

    goto LABEL_52;
  }
  NSUInteger v29 = v5;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  int v13 = 0;
  while (2)
  {
    int v30 = v13;
    int v14 = 0;
    uint64_t v15 = -v12;
    uint64_t v16 = v12 + 64;
    CFIndex v28 = v12;
    while (1)
    {
      uint64_t v17 = (unint64_t)v12 >= 4 ? 4 : v12;
      CFIndex v18 = v43;
      if (v43 > v12)
      {
        if (v40)
        {
          UniChar v19 = v40[v12 + v42];
        }
        else if (v41)
        {
          UniChar v19 = v41[v42 + v12];
        }
        else
        {
          if (v45 <= v12 || v11 > v12)
          {
            uint64_t v21 = v17 + v15;
            CFIndex v22 = v16 - v17;
            uint64_t v23 = v12 - v17;
            CFIndex v24 = v23 + 64;
            if (v23 + 64 >= v43) {
              CFIndex v24 = v43;
            }
            uint64_t v44 = v23;
            uint64_t v45 = v24;
            if (v43 >= v22) {
              CFIndex v18 = v22;
            }
            v46.NSUInteger length = v18 + v21;
            v46.NSUInteger location = v23 + v42;
            CFStringGetCharacters(theString, v46, buffer);
            uint64_t v11 = v44;
          }
          UniChar v19 = buffer[v12 - v11];
        }
        if (v19 == 13) {
          goto LABEL_30;
        }
        if (v19 == 10) {
          break;
        }
      }
      ++v14;
LABEL_30:
      ++v12;
      --v15;
      ++v16;
      if (Length == v12)
      {

        int v13 = v30;
        if (v14 >= 1) {
          goto LABEL_40;
        }
LABEL_46:
        uint64_t v12 = Length;
LABEL_47:
        id v5 = v29;
        goto LABEL_48;
      }
    }
    int v13 = v30;
    if (v14 || !v30)
    {
      if (v14 >= 151)
      {

        CFIndex Length = v28;
LABEL_40:
        if (v14 >= 0x97) {
          uint64_t v12 = v28;
        }
        else {
          uint64_t v12 = Length;
        }
        if (v14 < 0x97) {
          ++v13;
        }
        goto LABEL_47;
      }
      if (v30 != 4)
      {
        int v13 = v30 + 1;
        if (++v12 != Length) {
          continue;
        }

        goto LABEL_46;
      }
      int v13 = 5;
    }
    break;
  }
  id v5 = v29;

LABEL_48:
  if (v13 <= 1)
  {
LABEL_52:
  }
  else
  {

    if (v12)
    {
      uint64_t v25 = v12 + v3;
      if ((objc_msgSend(*(id *)(a1 + 32), "intersectsIndexesInRange:", v4, v25) & 1) == 0)
      {
        NSUInteger v26 = *(void **)(a1 + 48);
        objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v4, v25);
        uint64_t v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        [v26 addObject:v6];
        goto LABEL_52;
      }
    }
  }
LABEL_53:

  return 1;
}

- (_NSRange)signatureRange:(id)a3
{
  id v4 = a3;
  id v5 = [v4 htmlParser];
  uint64_t v6 = [v5 signatureRegions];
  if ([v6 count])
  {
    unint64_t v7 = [v6 firstIndex];
    unint64_t v8 = [v6 lastIndex];
    if (v8 >= v7) {
      uint64_t v9 = v7;
    }
    else {
      uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
    }
    if (v8 >= v7) {
      uint64_t v10 = v8 - v7 + 1;
    }
    else {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
    uint64_t v9 = 0x7FFFFFFFFFFFFFFFLL;
  }

  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = [(SGSignatureDissector *)self miniSignatureRange:v4];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v11 = [(SGSignatureDissector *)self hmmPlausibleSignatureRange:v4];
      if (v11 == 0x7FFFFFFFFFFFFFFFLL) {
        uint64_t v11 = [(SGSignatureDissector *)self hmmSignatureRange:v4];
      }
    }
    uint64_t v9 = v11;
    uint64_t v10 = v12;
  }

  NSUInteger v13 = v9;
  NSUInteger v14 = v10;
  result.NSUInteger length = v14;
  result.NSUInteger location = v13;
  return result;
}

- (id)initIgnoringDataDetectors
{
  v2 = [(SGSignatureDissector *)self init];
  uint64_t v3 = v2;
  if (v2)
  {
    ignoreDataDetectorsForTesting = v2->_ignoreDataDetectorsForTesting;
    v2->_ignoreDataDetectorsForTesting = (NSNumber *)MEMORY[0x1E4F1CC38];
  }
  return v3;
}

@end