@interface SGSignificantEmailAddressModelForIMessage
+ (id)newTransformerInstanceForLanguage:(id)a3;
@end

@implementation SGSignificantEmailAddressModelForIMessage

+ (id)newTransformerInstanceForLanguage:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v20 = a3;
  v17 = +[SGTransformerInstance defaultWindowAndNgrams];
  v3 = (void *)MEMORY[0x1E4F5DFC0];
  v21 = +[SGEntityMatchingTransformer withTargetMapping:@"SG_TARGET_EMAIL" phoneMapping:@"SG_FEATURE_PHONENUMBER" emailMapping:@"SG_FEATURE_EMAIL" addressMapping:@"SG_FEATURE_ADDRESS" andDateMapping:@"SG_FEATURE_DATE"];
  v22[0] = v21;
  v19 = +[SGEntityMappingTransformer withEmailMapping:@"SG_FEATURE_EMAIL" linkMapping:@"SG_FEATURE_LINK"];
  v22[1] = v19;
  v18 = +[SGTokenizerMappingTransformer forLocale:v20 withPersonalNameMapping:@"SG_FEATURE_FULLNAME"];
  v22[2] = v18;
  v4 = +[SGNameMappingTransformer withFullNameMapping:@"SG_FEATURE_FULLNAME" firstNameMapping:@"SG_FEATURE_FIRSTNAME" lastNameMapping:@"SG_FEATURE_LASTNAME" andPossessive:@"SG_POSSESSIVE"];
  v22[3] = v4;
  v5 = +[SGSymbolicMappingTransformer withNumericMapping:@"SG_FEATURE_NUMBER" andSymbolicMapping:@"SG_FEATURE_SYMBOL"];
  v22[4] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:5];
  v7 = [v3 withTransformers:v6];
  v8 = +[SGConversationFlatteningTransformer withPerMessageTransformer:v7];
  v23[0] = v8;
  v9 = (void *)MEMORY[0x1E4F93808];
  v10 = [v17 second];
  v11 = objc_msgSend(v9, "withBucketSize:andNgrams:", 10000, objc_msgSend(v10, "intValue"));
  v23[1] = v11;
  v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  v13 = [v3 withTransformers:v12];

  v14 = +[SGTransformerInstance defaultSessionDescriptorForModelId:@"SignificantEmailAddressForIMessage" featureVersion:@"1.5" language:v20 windowAndNgrams:v17];

  v15 = [[SGTransformerInstance alloc] initWithTransformer:v13 sessionDescriptor:v14 modelClass:objc_opt_class()];
  return v15;
}

@end