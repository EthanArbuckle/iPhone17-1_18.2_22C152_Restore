@interface LPConcretePresentationProperties
- (BOOL)hasMedia;
- (LPCaptionButtonPresentationProperties)captionButton;
- (LPCaptionButtonPresentationProperties)captionTextButton;
- (LPConcretePresentationProperties)initWithParameters:(id)a3 properties:(id)a4;
- (void)setCaptionButton:(id)a3;
- (void)setCaptionTextButton:(id)a3;
@end

@implementation LPConcretePresentationProperties

- (LPConcretePresentationProperties)initWithParameters:(id)a3 properties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v151.receiver = self;
  v151.super_class = (Class)LPConcretePresentationProperties;
  v8 = [(LPConcretePresentationProperties *)&v151 init];

  if (!v8) {
    goto LABEL_178;
  }
  uint64_t v9 = [v6 captionButton];
  captionButton = v8->_captionButton;
  v8->_captionButton = (LPCaptionButtonPresentationProperties *)v9;

  uint64_t v11 = [v6 captionTextButton];
  captionTextButton = v8->_captionTextButton;
  v8->_captionTextButton = (LPCaptionButtonPresentationProperties *)v11;

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __66__LPConcretePresentationProperties_initWithParameters_properties___block_invoke;
  aBlock[3] = &unk_1E5B06960;
  v13 = v8;
  v150 = v13;
  v145 = (void (**)(void *, void *, uint64_t))_Block_copy(aBlock);
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v7 overrideURL],
        id v14 = (id)objc_claimAutoreleasedReturnValue(),
        v14,
        v14))
  {
    v142 = v14;
    [(LPWebLinkPresentationProperties *)v13 setOverrideURL:v14];
    char v15 = objc_opt_respondsToSelector();
    if (v15)
    {
      v16 = [v7 overrideAllowOpeningSensitiveURLs];
    }
    else
    {
      v16 = 0;
    }
    [(LPWebLinkPresentationProperties *)v13 setOverrideAllowOpeningSensitiveURLs:v16];
    if (v15) {
  }
    }
  else
  {
    v142 = 0;
  }
  if (objc_opt_respondsToSelector()) {
    uint64_t v17 = [v7 isPreliminary];
  }
  else {
    uint64_t v17 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setPreliminary:v17];
  if (objc_opt_respondsToSelector()) {
    uint64_t v18 = [v7 style];
  }
  else {
    uint64_t v18 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setStyle:v18];
  if (objc_opt_respondsToSelector())
  {
    id v19 = [v7 topCaption];
  }
  else
  {
    id v19 = 0;
  }
  v144 = v19;
  if (objc_opt_respondsToSelector())
  {
    id v148 = [v7 bottomCaption];
  }
  else
  {
    id v148 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v147 = [v7 trailingTopCaption];
  }
  else
  {
    id v147 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    id v146 = [v7 trailingBottomCaption];

    if (v19) {
      goto LABEL_31;
    }
  }
  else
  {
    id v146 = 0;
    if (v19)
    {
LABEL_31:
      v22 = objc_alloc_init(LPCaptionBarPresentationProperties);
      [(LPWebLinkPresentationProperties *)v13 setCaptionBar:v22];

      v23 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v24 = [v23 top];
      v25 = [v24 leading];
      [v25 setText:v144];

      v26 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v27 = [v26 bottom];
      v28 = [v27 leading];
      [v28 setText:v148];

      v29 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v30 = [v29 top];
      v31 = [v30 trailing];
      [v31 setText:v147];

      v21 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v32 = [v21 bottom];
      v33 = [v32 trailing];
      [v33 setText:v146];

LABEL_34:
      goto LABEL_35;
    }
  }
  if (v148 || v147 || v146) {
    goto LABEL_31;
  }
  char v20 = objc_opt_respondsToSelector();
  if (v20)
  {
    v21 = [v7 captionBar];
  }
  else
  {
    v21 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setCaptionBar:v21];
  if (v20) {
    goto LABEL_34;
  }
LABEL_35:
  v34 = [v6 overrideSubtitle];

  if (v34)
  {
    v35 = [v6 overrideSubtitle];
    v36 = [(LPWebLinkPresentationProperties *)v13 captionBar];
    v37 = [v36 bottom];
    v38 = [v37 leading];
    [v38 setAttributedText:v35];
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && ([v7 icon],
        id v39 = (id)objc_claimAutoreleasedReturnValue(),
        v39,
        (v143 = v39) != 0))
  {
    v40 = [(LPWebLinkPresentationProperties *)v13 captionBar];
    [v40 setTrailingIcon:v143];
  }
  else
  {
    v143 = 0;
  }
  if (([v6 usesComputedPresentationProperties] & 1) == 0
    && [(LPWebLinkPresentationProperties *)v13 style] == 44)
  {
    v41 = +[LPWalletPresentationSpecialization captionButtonPropertiesForPasses];
    v145[2](v145, v41, 1);
  }
  if (([v6 usesComputedPresentationProperties] & 1) == 0
    && [(LPWebLinkPresentationProperties *)v13 style] == 53)
  {
    v42 = +[LPWalletPresentationSpecialization captionButtonPropertiesForOrders];
    v145[2](v145, v42, 1);
  }
  if (sizeClassAllowsPillButtonFromSpecialization([v6 effectiveSizeClass]))
  {
    if ([(LPWebLinkPresentationProperties *)v13 style] == 46)
    {
      v43 = +[LPFaceTimeInvitePresentationSpecialization captionButtonProperties];
      v145[2](v145, v43, [v6 inComposeContext] ^ 1);
    }
    if ([(LPWebLinkPresentationProperties *)v13 style] == 48)
    {
      v44 = +[LPPasswordsInvitePresentationSpecialization captionButtonProperties];
      v145[2](v145, v44, [v6 inComposeContext] ^ 1);
    }
  }
  if (([v6 inComposeContext] & 1) == 0
    && sizeClassAllowsPillButtonFromSpecialization([v6 effectiveSizeClass])
    && [(LPWebLinkPresentationProperties *)v13 style] == 50
    && ([v6 inSenderContext] & 1) == 0)
  {
    v45 = +[LPApplePhotosSharedLibraryInvitationPresentationSpecialization captionButtonProperties];
    v145[2](v145, v45, 1);
  }
  v46 = [(LPWebLinkPresentationProperties *)v13 captionBar];
  v47 = [v46 playButton];

  if (!v47)
  {
    v48 = objc_alloc_init(LPPlayButtonPresentationProperties);
    v49 = [(LPWebLinkPresentationProperties *)v13 captionBar];
    [v49 setPlayButton:v48];
  }
  uint64_t v50 = [v6 inComposeContext];
  v51 = [(LPWebLinkPresentationProperties *)v13 captionBar];
  v52 = [v51 playButton];
  [v52 setDisabled:v50];

  if ([(LPWebLinkPresentationProperties *)v13 style] == 47)
  {
    if (!v8->_captionTextButton) {
      goto LABEL_70;
    }
    v53 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(LPCaptionButtonPresentationProperties *)v8->_captionTextButton setForegroundColor:v53];
  }
  v54 = v8->_captionTextButton;
  if (v54)
  {
    if ([(LPCaptionButtonPresentationProperties *)v54 type] == 2)
    {
      v55 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v56 = [v55 bottom];
      v57 = [v56 leading];
      [v57 setText:0];

      v58 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v59 = [v58 bottom];
      v60 = [v59 trailing];
      [v60 setText:0];

      v61 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v62 = [v61 belowBottom];
      v63 = [v62 leading];
      [v63 setText:0];

      v64 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      v65 = [v64 belowBottom];
      v66 = [v65 trailing];
      [v66 setText:0];
    }
    v67 = [v6 overrideSubtitleButtonColor];

    if (v67)
    {
      v68 = [v6 overrideSubtitleButtonColor];
      [(LPCaptionButtonPresentationProperties *)v8->_captionTextButton setBackgroundColor:v68];
    }
    v69 = [(LPWebLinkPresentationProperties *)v13 captionBar];
    v70 = [v69 bottom];

    if (([v70 hasAnyContent] & 1) == 0)
    {
      v71 = [v70 leading];
      [v71 setText:@"​"];
    }
    [v70 setButton:v8->_captionTextButton];
  }
LABEL_70:
  if (v8->_captionButton)
  {
    v72 = [v6 overrideActionButtonColor];

    if (v72)
    {
      v73 = [v6 overrideActionButtonColor];
      [(LPCaptionButtonPresentationProperties *)v8->_captionButton setBackgroundColor:v73];
    }
    if ((sizeClassAllowsPillButton([v6 effectiveSizeClass]) & 1) != 0
      || sizeClassAllowsPillButton([v6 effectiveSizeClass])
      && ([(LPConcretePresentationProperties *)v13 captionButton],
          v74 = objc_claimAutoreleasedReturnValue(),
          [v74 actions],
          v75 = objc_claimAutoreleasedReturnValue(),
          v75,
          v74,
          v75))
    {
      v76 = v8->_captionButton;
      v77 = [(LPWebLinkPresentationProperties *)v13 captionBar];
      [v77 setButton:v76];

      if ([v6 effectiveSizeClass] == 12)
      {
        v78 = [(LPConcretePresentationProperties *)v13 captionButton];
        v79 = [v78 actions];
        if ((unint64_t)[v79 count] >= 2)
        {
        }
        else
        {
          v80 = [(LPConcretePresentationProperties *)v13 captionButton];
          v81 = [v80 actions];
          if ([v81 count] != 1)
          {

LABEL_88:
            goto LABEL_89;
          }
          v141 = [(LPConcretePresentationProperties *)v13 captionButton];
          v140 = [v141 actions];
          v82 = [v140 firstObject];
          v83 = [v82 handler];

          if (v83) {
            goto LABEL_89;
          }
        }
        v84 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v85 = [v84 bottom];
        v86 = [v85 leading];
        [v86 setText:0];

        v87 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v88 = [v87 bottom];
        v89 = [v88 trailing];
        [v89 setText:0];

        v90 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v91 = [v90 belowBottom];
        v92 = [v91 leading];
        [v92 setText:0];

        v93 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v94 = [v93 belowBottom];
        uint64_t v95 = [v94 trailing];
        [(id)v95 setText:0];

        v96 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v97 = [v96 top];
        LOBYTE(v95) = [v97 hasAnyContent];

        if (v95) {
          goto LABEL_89;
        }
        v78 = [(LPWebLinkPresentationProperties *)v13 captionBar];
        v79 = [v78 top];
        v80 = [v79 leading];
        [v80 setText:@"​"];
        goto LABEL_88;
      }
    }
  }
LABEL_89:
  if (objc_opt_respondsToSelector())
  {
    unint64_t v98 = [v7 mediaTopCaption];
  }
  else
  {
    unint64_t v98 = 0;
  }
  if (objc_opt_respondsToSelector())
  {
    unint64_t v99 = [v7 mediaBottomCaption];
  }
  else
  {
    unint64_t v99 = 0;
  }
  if (v98 | v99)
  {
    v100 = objc_alloc_init(LPCaptionBarPresentationProperties);
    [(LPWebLinkPresentationProperties *)v13 setMediaBottomCaptionBar:v100];

    v101 = [(LPWebLinkPresentationProperties *)v13 mediaBottomCaptionBar];
    v102 = [v101 top];
    v103 = [v102 leading];
    [v103 setText:v98];

    v104 = [(LPWebLinkPresentationProperties *)v13 mediaBottomCaptionBar];
    v105 = [v104 bottom];
    v106 = [v105 leading];
    [v106 setText:v99];
  }
  else
  {
    char v107 = objc_opt_respondsToSelector();
    if (v107)
    {
      v104 = [v7 mediaBottomCaptionBar];
    }
    else
    {
      v104 = 0;
    }
    [(LPWebLinkPresentationProperties *)v13 setMediaBottomCaptionBar:v104];
    if ((v107 & 1) == 0) {
      goto LABEL_102;
    }
  }

LABEL_102:
  char v108 = objc_opt_respondsToSelector();
  if (v108)
  {
    v109 = [v7 mediaTopCaptionBar];
  }
  else
  {
    v109 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setMediaTopCaptionBar:v109];
  if (v108) {

  }
  char v110 = objc_opt_respondsToSelector();
  if (v110)
  {
    v111 = [v7 quotedText];
  }
  else
  {
    v111 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setQuotedText:v111];
  if (v110) {

  }
  char v112 = objc_opt_respondsToSelector();
  if (v112)
  {
    v113 = [v7 image];
  }
  else
  {
    v113 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setImage:v113];
  if (v112) {

  }
  char v114 = objc_opt_respondsToSelector();
  if (v114)
  {
    v115 = [v7 imageProperties];
  }
  else
  {
    v115 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setImageProperties:v115];
  if (v114) {

  }
  char v116 = objc_opt_respondsToSelector();
  if (v116)
  {
    v117 = [v7 alternateImages];
  }
  else
  {
    v117 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setAlternateImages:v117];
  if (v116) {

  }
  char v118 = objc_opt_respondsToSelector();
  if (v118)
  {
    v119 = [v7 arAsset];
  }
  else
  {
    v119 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setArAsset:v119];
  if (v118) {

  }
  char v120 = objc_opt_respondsToSelector();
  if (v120)
  {
    v121 = [v7 video];
  }
  else
  {
    v121 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setVideo:v121];
  if (v120) {

  }
  char v122 = objc_opt_respondsToSelector();
  if (v122)
  {
    v123 = [v7 inlinePlaybackInformation];
  }
  else
  {
    v123 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setInlinePlaybackInformation:v123];
  if (v122) {

  }
  char v124 = objc_opt_respondsToSelector();
  if (v124)
  {
    v125 = [v7 backgroundColor];
  }
  else
  {
    v125 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setBackgroundColor:v125];
  if (v124) {

  }
  char v126 = objc_opt_respondsToSelector();
  if (v126)
  {
    v127 = [v7 dominantImageBackgroundColor];
  }
  else
  {
    v127 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setDominantImageBackgroundColor:v127];
  if (v126) {

  }
  char v128 = objc_opt_respondsToSelector();
  if (v128)
  {
    v129 = [v7 minimumHeight];
  }
  else
  {
    v129 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setMinimumHeight:v129];
  if (v128) {

  }
  char v130 = objc_opt_respondsToSelector();
  if (v130)
  {
    v131 = [v7 domainNameForIndicator];
  }
  else
  {
    v131 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setDomainNameForIndicator:v131];
  if (v130) {

  }
  char v132 = objc_opt_respondsToSelector();
  if (v132)
  {
    v133 = [v7 backgroundImage];
  }
  else
  {
    v133 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setBackgroundImage:v133];
  if (v132) {

  }
  char v134 = objc_opt_respondsToSelector();
  if (v134)
  {
    v135 = [v7 backgroundImageProperties];
  }
  else
  {
    v135 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setBackgroundImageProperties:v135];
  if (v134) {

  }
  char v136 = objc_opt_respondsToSelector();
  if (v136)
  {
    v137 = [v7 progressSpinner];
  }
  else
  {
    v137 = 0;
  }
  [(LPWebLinkPresentationProperties *)v13 setProgressSpinner:v137];
  if (v136) {

  }
  v138 = v13;
LABEL_178:

  return v8;
}

void __66__LPConcretePresentationProperties_initWithParameters_properties___block_invoke(uint64_t a1, void *a2, int a3)
{
  id v8 = a2;
  uint64_t v6 = [v8 type];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v6 == 1)
  {
    objc_storeStrong((id *)(v7 + 184), a2);
    [*(id *)(*(void *)(a1 + 32) + 184) setDisabled:a3 ^ 1u];
  }
  else
  {
    objc_storeStrong((id *)(v7 + 192), a2);
  }
}

- (BOOL)hasMedia
{
  v3 = [(LPWebLinkPresentationProperties *)self image];
  if (v3)
  {
    BOOL v4 = 1;
  }
  else
  {
    v5 = [(LPWebLinkPresentationProperties *)self video];
    if (v5)
    {
      BOOL v4 = 1;
    }
    else
    {
      uint64_t v6 = [(LPWebLinkPresentationProperties *)self arAsset];
      if (v6) {
        BOOL v4 = 1;
      }
      else {
        BOOL v4 = [(LPWebLinkPresentationProperties *)self style] == 15;
      }
    }
  }

  return v4;
}

- (LPCaptionButtonPresentationProperties)captionButton
{
  return self->_captionButton;
}

- (void)setCaptionButton:(id)a3
{
}

- (LPCaptionButtonPresentationProperties)captionTextButton
{
  return self->_captionTextButton;
}

- (void)setCaptionTextButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captionTextButton, 0);

  objc_storeStrong((id *)&self->_captionButton, 0);
}

@end