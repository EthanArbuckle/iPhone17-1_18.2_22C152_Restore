@interface _CNUIUserActionImageProvider
+ (id)imageForActionType:(id)a3 imageStyle:(int64_t)a4;
+ (id)imageResourceNameForActionType:(id)a3;
+ (id)symbolImageNameForActionType:(id)a3;
+ (id)symbolOulinedImageNameForActionType:(id)a3;
@end

@implementation _CNUIUserActionImageProvider

+ (id)imageForActionType:(id)a3 imageStyle:(int64_t)a4
{
  v4 = +[_CNUIUserActionImageProvider symbolImageNameForActionType:](_CNUIUserActionImageProvider, "symbolImageNameForActionType:", a3, a4);
  v5 = [MEMORY[0x263F1C6B0] preferredSymbolImageNamed:v4 size:*MEMORY[0x263F1D378] compatibleWithTextStyle:*MEMORY[0x263F1D260]];

  return v5;
}

+ (id)imageResourceNameForActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263EFDF10]])
  {
    v4 = @"EmailActionGlyphTemplate";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF18]])
  {
    v4 = @"TextActionGlyphTemplate";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    v4 = @"VideoActionGlyphTemplate";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDEF8]])
  {
    v4 = @"VoiceActionGlyphTemplate";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF20]])
  {
    v4 = @"PayActionGlyphTemplate";
  }
  else
  {
    v4 = @"DirectionsActionGlyphTemplate";
    if (([v3 isEqualToString:*MEMORY[0x263EFDF00]] & 1) == 0
      && ![v3 isEqualToString:*MEMORY[0x263EFDF08]])
    {
      v4 = 0;
    }
  }

  return v4;
}

+ (id)symbolImageNameForActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263EFDF10]])
  {
    v4 = @"envelope.fill";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF18]])
  {
    v4 = @"message.fill";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    v4 = @"video.fill";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDEF8]])
  {
    v4 = @"phone.fill";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF20]])
  {
    v4 = @"applepaycash";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF00]])
  {
    v4 = @"arrow.triangle.turn.up.right.circle.fill";
  }
  else if (([v3 isEqualToString:*MEMORY[0x263EFDF28]] & 1) != 0 {
         || ([v3 isEqualToString:*MEMORY[0x263EFDF30]] & 1) != 0)
  }
  {
    v4 = @"teletype";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF08]])
  {
    v4 = @"rectangle.fill.on.rectangle.fill";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

+ (id)symbolOulinedImageNameForActionType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:*MEMORY[0x263EFDF10]])
  {
    v4 = @"envelope";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF18]])
  {
    v4 = @"message";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF38]])
  {
    v4 = @"video";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDEF8]])
  {
    v4 = @"phone";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF20]])
  {
    v4 = @"applepaycash";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF00]])
  {
    v4 = @"arrow.triangle.turn.up.right.circle";
  }
  else if (([v3 isEqualToString:*MEMORY[0x263EFDF28]] & 1) != 0 {
         || ([v3 isEqualToString:*MEMORY[0x263EFDF30]] & 1) != 0)
  }
  {
    v4 = @"teletype";
  }
  else if ([v3 isEqualToString:*MEMORY[0x263EFDF08]])
  {
    v4 = @"rectangle.on.rectangle";
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

@end