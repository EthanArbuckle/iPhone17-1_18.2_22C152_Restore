@interface PCNativeRepresentation
+ (BOOL)supportsSecureCoding;
- (NSArray)elements;
- (NSArray)localizedHeadlines;
- (NSString)accessibleAdCopy;
- (NSString)accessibleHeadline;
- (NSString)adCopy;
- (NSString)headline;
- (NSString)localeIdentifier;
- (NSString)sponsor;
- (NSString)sponsorshipIdentifier;
- (NSURL)actionURL;
- (NSURL)sponsoredByAssetURL;
- (NSURL)sponsoredByAssetURLForDarkMode;
- (PCNativeButton)button;
- (PCNativeRepresentation)initWithCoder:(id)a3;
- (PCNativeStyle)defaultStyle;
- (int64_t)adFormatType;
- (int64_t)adType;
- (void)encodeWithCoder:(id)a3;
- (void)setAccessibleAdCopy:(id)a3;
- (void)setAccessibleHeadline:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setAdCopy:(id)a3;
- (void)setAdFormatType:(int64_t)a3;
- (void)setAdType:(int64_t)a3;
- (void)setButton:(id)a3;
- (void)setDefaultStyle:(id)a3;
- (void)setElements:(id)a3;
- (void)setHeadline:(id)a3;
- (void)setLocaleIdentifier:(id)a3;
- (void)setLocalizedHeadlines:(id)a3;
- (void)setSponsor:(id)a3;
- (void)setSponsoredByAssetURL:(id)a3;
- (void)setSponsoredByAssetURLForDarkMode:(id)a3;
- (void)setSponsorshipIdentifier:(id)a3;
@end

@implementation PCNativeRepresentation

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PCNativeRepresentation)initWithCoder:(id)a3
{
  id v4 = a3;
  v124.receiver = self;
  v124.super_class = (Class)PCNativeRepresentation;
  v8 = [(APRepresentationData *)&v124 initWithCoder:v4];
  if (v8)
  {
    v8->_adType = (int)objc_msgSend_decodeInt32ForKey_(v4, v5, @"adType", v6, v7, v9, v10);
    uint64_t v11 = objc_opt_class();
    uint64_t v16 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v12, v11, @"accessibleAdCopy", v13, v14, v15);
    accessibleAdCopy = v8->_accessibleAdCopy;
    v8->_accessibleAdCopy = (NSString *)v16;

    uint64_t v18 = objc_opt_class();
    uint64_t v23 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v19, v18, @"accessibleHeadline", v20, v21, v22);
    accessibleHeadline = v8->_accessibleHeadline;
    v8->_accessibleHeadline = (NSString *)v23;

    uint64_t v25 = objc_opt_class();
    uint64_t v30 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v26, v25, @"adCopy", v27, v28, v29);
    adCopy = v8->_adCopy;
    v8->_adCopy = (NSString *)v30;

    uint64_t v32 = objc_opt_class();
    uint64_t v37 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v33, v32, @"defaultStyle", v34, v35, v36);
    defaultStyle = v8->_defaultStyle;
    v8->_defaultStyle = (PCNativeStyle *)v37;

    id v39 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v40 = objc_opt_class();
    uint64_t v41 = objc_opt_class();
    v47 = objc_msgSend_initWithObjects_(v39, v42, v40, v43, v44, v45, v46, v41, 0);
    uint64_t v52 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v48, (uint64_t)v47, @"elements", v49, v50, v51);
    elements = v8->_elements;
    v8->_elements = (NSArray *)v52;

    uint64_t v54 = objc_opt_class();
    uint64_t v59 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v55, v54, @"headline", v56, v57, v58);
    headline = v8->_headline;
    v8->_headline = (NSString *)v59;

    uint64_t v61 = objc_opt_class();
    uint64_t v66 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v62, v61, @"localeIdentifier", v63, v64, v65);
    localeIdentifier = v8->_localeIdentifier;
    v8->_localeIdentifier = (NSString *)v66;

    uint64_t v68 = objc_opt_class();
    uint64_t v73 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v69, v68, @"sponsor", v70, v71, v72);
    sponsor = v8->_sponsor;
    v8->_sponsor = (NSString *)v73;

    v8->_adFormatType = (int)objc_msgSend_decodeInt32ForKey_(v4, v75, @"adFormatType", v76, v77, v78, v79);
    uint64_t v80 = objc_opt_class();
    uint64_t v85 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v81, v80, @"kSponsoredByAsset", v82, v83, v84);
    sponsoredByAssetURL = v8->_sponsoredByAssetURL;
    v8->_sponsoredByAssetURL = (NSURL *)v85;

    uint64_t v87 = objc_opt_class();
    uint64_t v92 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v88, v87, @"kSponsoredByAssetForDarkMode", v89, v90, v91);
    sponsoredByAssetURLForDarkMode = v8->_sponsoredByAssetURLForDarkMode;
    v8->_sponsoredByAssetURLForDarkMode = (NSURL *)v92;

    id v94 = objc_alloc(MEMORY[0x263EFFA08]);
    uint64_t v95 = objc_opt_class();
    uint64_t v96 = objc_opt_class();
    v102 = objc_msgSend_initWithObjects_(v94, v97, v95, v98, v99, v100, v101, v96, 0);
    uint64_t v107 = objc_msgSend_decodeObjectOfClasses_forKey_(v4, v103, (uint64_t)v102, @"kLocalizedHeadlines", v104, v105, v106);
    localizedHeadlines = v8->_localizedHeadlines;
    v8->_localizedHeadlines = (NSArray *)v107;

    uint64_t v109 = objc_opt_class();
    uint64_t v114 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v110, v109, @"kButton", v111, v112, v113);
    button = v8->_button;
    v8->_button = (PCNativeButton *)v114;

    uint64_t v116 = objc_opt_class();
    uint64_t v121 = objc_msgSend_decodeObjectOfClass_forKey_(v4, v117, v116, @"lActionURL", v118, v119, v120);
    actionURL = v8->_actionURL;
    v8->_actionURL = (NSURL *)v121;
  }
  return v8;
}

- (void)encodeWithCoder:(id)a3
{
  v170.receiver = self;
  v170.super_class = (Class)PCNativeRepresentation;
  id v4 = a3;
  [(APRepresentationData *)&v170 encodeWithCoder:v4];
  uint64_t v11 = objc_msgSend_adType(self, v5, v6, v7, v8, v9, v10, v170.receiver, v170.super_class);
  objc_msgSend_encodeInt32_forKey_(v4, v12, v11, @"adType", v13, v14, v15);
  double v22 = objc_msgSend_accessibleAdCopy(self, v16, v17, v18, v19, v20, v21);
  objc_msgSend_encodeObject_forKey_(v4, v23, (uint64_t)v22, @"accessibleAdCopy", v24, v25, v26);

  v33 = objc_msgSend_accessibleHeadline(self, v27, v28, v29, v30, v31, v32);
  objc_msgSend_encodeObject_forKey_(v4, v34, (uint64_t)v33, @"accessibleHeadline", v35, v36, v37);

  uint64_t v44 = objc_msgSend_adCopy(self, v38, v39, v40, v41, v42, v43);
  objc_msgSend_encodeObject_forKey_(v4, v45, (uint64_t)v44, @"adCopy", v46, v47, v48);

  v55 = objc_msgSend_defaultStyle(self, v49, v50, v51, v52, v53, v54);
  objc_msgSend_encodeObject_forKey_(v4, v56, (uint64_t)v55, @"defaultStyle", v57, v58, v59);

  uint64_t v66 = objc_msgSend_elements(self, v60, v61, v62, v63, v64, v65);
  objc_msgSend_encodeObject_forKey_(v4, v67, (uint64_t)v66, @"elements", v68, v69, v70);

  uint64_t v77 = objc_msgSend_headline(self, v71, v72, v73, v74, v75, v76);
  objc_msgSend_encodeObject_forKey_(v4, v78, (uint64_t)v77, @"headline", v79, v80, v81);

  v88 = objc_msgSend_localeIdentifier(self, v82, v83, v84, v85, v86, v87);
  objc_msgSend_encodeObject_forKey_(v4, v89, (uint64_t)v88, @"localeIdentifier", v90, v91, v92);

  uint64_t v99 = objc_msgSend_sponsor(self, v93, v94, v95, v96, v97, v98);
  objc_msgSend_encodeObject_forKey_(v4, v100, (uint64_t)v99, @"sponsor", v101, v102, v103);

  uint64_t v110 = objc_msgSend_adFormatType(self, v104, v105, v106, v107, v108, v109);
  objc_msgSend_encodeInt32_forKey_(v4, v111, v110, @"adFormatType", v112, v113, v114);
  uint64_t v121 = objc_msgSend_sponsoredByAssetURL(self, v115, v116, v117, v118, v119, v120);
  objc_msgSend_encodeObject_forKey_(v4, v122, (uint64_t)v121, @"kSponsoredByAsset", v123, v124, v125);

  v132 = objc_msgSend_sponsoredByAssetURLForDarkMode(self, v126, v127, v128, v129, v130, v131);
  objc_msgSend_encodeObject_forKey_(v4, v133, (uint64_t)v132, @"kSponsoredByAssetForDarkMode", v134, v135, v136);

  v143 = objc_msgSend_localizedHeadlines(self, v137, v138, v139, v140, v141, v142);
  objc_msgSend_encodeObject_forKey_(v4, v144, (uint64_t)v143, @"kLocalizedHeadlines", v145, v146, v147);

  v154 = objc_msgSend_button(self, v148, v149, v150, v151, v152, v153);
  objc_msgSend_encodeObject_forKey_(v4, v155, (uint64_t)v154, @"kButton", v156, v157, v158);

  v165 = objc_msgSend_actionURL(self, v159, v160, v161, v162, v163, v164);
  objc_msgSend_encodeObject_forKey_(v4, v166, (uint64_t)v165, @"lActionURL", v167, v168, v169);
}

- (int64_t)adType
{
  return self->_adType;
}

- (void)setAdType:(int64_t)a3
{
  self->_adType = a3;
}

- (NSString)accessibleAdCopy
{
  return self->_accessibleAdCopy;
}

- (void)setAccessibleAdCopy:(id)a3
{
}

- (NSString)accessibleHeadline
{
  return self->_accessibleHeadline;
}

- (void)setAccessibleHeadline:(id)a3
{
}

- (NSString)adCopy
{
  return self->_adCopy;
}

- (void)setAdCopy:(id)a3
{
}

- (PCNativeStyle)defaultStyle
{
  return self->_defaultStyle;
}

- (void)setDefaultStyle:(id)a3
{
}

- (NSArray)elements
{
  return self->_elements;
}

- (void)setElements:(id)a3
{
}

- (NSString)headline
{
  return self->_headline;
}

- (void)setHeadline:(id)a3
{
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (void)setLocaleIdentifier:(id)a3
{
}

- (NSString)sponsor
{
  return self->_sponsor;
}

- (void)setSponsor:(id)a3
{
}

- (int64_t)adFormatType
{
  return self->_adFormatType;
}

- (void)setAdFormatType:(int64_t)a3
{
  self->_adFormatType = a3;
}

- (NSURL)sponsoredByAssetURL
{
  return self->_sponsoredByAssetURL;
}

- (void)setSponsoredByAssetURL:(id)a3
{
}

- (NSURL)sponsoredByAssetURLForDarkMode
{
  return self->_sponsoredByAssetURLForDarkMode;
}

- (void)setSponsoredByAssetURLForDarkMode:(id)a3
{
}

- (NSArray)localizedHeadlines
{
  return self->_localizedHeadlines;
}

- (void)setLocalizedHeadlines:(id)a3
{
}

- (PCNativeButton)button
{
  return self->_button;
}

- (void)setButton:(id)a3
{
}

- (NSURL)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)sponsorshipIdentifier
{
  return self->_sponsorshipIdentifier;
}

- (void)setSponsorshipIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sponsorshipIdentifier, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_localizedHeadlines, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURLForDarkMode, 0);
  objc_storeStrong((id *)&self->_sponsoredByAssetURL, 0);
  objc_storeStrong((id *)&self->_sponsor, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
  objc_storeStrong((id *)&self->_headline, 0);
  objc_storeStrong((id *)&self->_elements, 0);
  objc_storeStrong((id *)&self->_defaultStyle, 0);
  objc_storeStrong((id *)&self->_adCopy, 0);
  objc_storeStrong((id *)&self->_accessibleHeadline, 0);
  objc_storeStrong((id *)&self->_accessibleAdCopy, 0);
}

@end