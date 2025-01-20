@interface _CNUIUserActionDirectionsTarget
+ (id)mapsUrlFromLabeledValue:(id)a3 contact:(id)a4;
+ (id)queryBySanitizingQuery:(id)a3;
+ (id)queryByTrimmingEmptySpaceInQuery:(id)a3;
- (_CNUIUserActionDirectionsTarget)init;
- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5;
@end

@implementation _CNUIUserActionDirectionsTarget

+ (id)mapsUrlFromLabeledValue:(id)a3 contact:(id)a4
{
  v5 = (void *)MEMORY[0x263EFEB38];
  id v6 = a4;
  id v7 = a3;
  v8 = [v7 value];
  v9 = [v5 singleLineStringFromPostalAddress:v8 addCountryName:0];
  v10 = [MEMORY[0x263F08708] URLPathAllowedCharacterSet];
  v11 = [v9 stringByAddingPercentEncodingWithAllowedCharacters:v10];

  v12 = NSString;
  v13 = [v6 identifier];

  v14 = [v7 identifier];

  v15 = [v12 stringWithFormat:@"maps:?address=%@&cncontactidentifier=%@&cnaddressidentifier=%@", v11, v13, v14];

  v16 = [NSURL URLWithString:v15];

  return v16;
}

+ (id)queryByTrimmingEmptySpaceInQuery:(id)a3
{
  v3 = (void *)MEMORY[0x263F08708];
  id v4 = a3;
  v5 = [v3 characterSetWithCharactersInString:@", "];
  id v6 = [v4 stringByTrimmingCharactersInSet:v5];

  return v6;
}

+ (id)queryBySanitizingQuery:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@" " withString:@"+"];
  id v4 = [MEMORY[0x263F08708] URLQueryAllowedCharacterSet];
  v5 = [v3 stringByAddingPercentEncodingWithAllowedCharacters:v4];

  id v6 = [v5 stringByReplacingOccurrencesOfString:@"&" withString:@"%26"];

  id v7 = [v6 stringByReplacingOccurrencesOfString:@"@" withString:@"%40"];

  return v7;
}

- (_CNUIUserActionDirectionsTarget)init
{
  uint64_t v2 = *MEMORY[0x263EFDED0];
  v4.receiver = self;
  v4.super_class = (Class)_CNUIUserActionDirectionsTarget;
  return [(CNUIUserActionTarget *)&v4 initWithName:@"Maps" bundleIdentifier:v2 teamIdentifier:0];
}

- (id)actionsForPostalAddresses:(id)a3 contact:(id)a4 discoveringEnvironment:(id)a5
{
  id v7 = a4;
  v11[0] = MEMORY[0x263EF8330];
  v11[1] = 3221225472;
  v11[2] = __92___CNUIUserActionDirectionsTarget_actionsForPostalAddresses_contact_discoveringEnvironment___block_invoke;
  v11[3] = &unk_264018ED0;
  v11[4] = self;
  id v12 = v7;
  id v8 = v7;
  v9 = objc_msgSend(a3, "_cn_map:", v11);

  return v9;
}

@end