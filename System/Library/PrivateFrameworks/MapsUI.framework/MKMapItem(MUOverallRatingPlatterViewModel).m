@interface MKMapItem(MUOverallRatingPlatterViewModel)
- (double)rating;
- (id)attributionText;
- (uint64_t)numberOfVotes;
@end

@implementation MKMapItem(MUOverallRatingPlatterViewModel)

- (double)rating
{
  [a1 _normalizedUserRatingScore];
  return v1;
}

- (uint64_t)numberOfVotes
{
  return [a1 _sampleSizeForUserRatingScore];
}

- (id)attributionText
{
  v15[3] = *MEMORY[0x1E4F143B8];
  v2 = [a1 _reviewsAttribution];
  v3 = +[MUInfoCardStyle attributionTintColor];
  v4 = [a1 _attributionFor:v2 sourceStringFormat:&stru_1EE3BF360 moreSourceStringFormat:&stru_1EE3BF360 imageTintColor:v3];

  v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithAttributedString:v4];
  v14[0] = *MEMORY[0x1E4FB0700];
  v6 = +[MUInfoCardStyle tintColor];
  uint64_t v7 = *MEMORY[0x1E4FB06C8];
  v15[0] = v6;
  v15[1] = &unk_1EE4047A8;
  uint64_t v8 = *MEMORY[0x1E4FB06F8];
  v14[1] = v7;
  v14[2] = v8;
  v9 = [MEMORY[0x1E4F30EA8] sharedManager];
  v10 = [v9 smallAttributionFont];
  v15[2] = v10;
  v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:3];
  objc_msgSend(v5, "addAttributes:range:", v11, 0, objc_msgSend(v5, "length"));

  v12 = (void *)[v5 copy];
  return v12;
}

@end