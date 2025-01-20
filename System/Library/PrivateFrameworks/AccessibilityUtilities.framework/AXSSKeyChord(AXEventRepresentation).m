@interface AXSSKeyChord(AXEventRepresentation)
+ (id)keyChordWithEvent:()AXEventRepresentation;
- (id)keyChordByUpdatingModifiersFromEvent:()AXEventRepresentation;
@end

@implementation AXSSKeyChord(AXEventRepresentation)

+ (id)keyChordWithEvent:()AXEventRepresentation
{
  id v3 = a3;
  if ([v3 type] == 10)
  {
    v4 = [v3 keyInfo];
    v5 = v4;
    if (v4)
    {
      int v6 = [v4 keyCode];
      v7 = 0;
      switch(v6)
      {
        case 'L':
          v7 = @"⌦";
          break;
        case 'M':
        case 'N':
        case 'S':
        case 'T':
        case 'U':
        case 'V':
        case 'W':
          break;
        case 'O':
          v7 = @"→";
          break;
        case 'P':
          v7 = @"←";
          break;
        case 'Q':
          v7 = @"↓";
          break;
        case 'R':
          v7 = @"↑";
          break;
        case 'X':
          v7 = @"⌤";
          break;
        default:
          switch(v6)
          {
            case '(':
              v7 = @"⏎";
              break;
            case '*':
              v7 = @"⌫";
              break;
            case '+':
              v7 = @"⇥";
              break;
            case ',':
              v7 = @"␣";
              break;
            default:
              goto LABEL_17;
          }
          break;
      }
LABEL_17:
      if ([(__CFString *)v7 length]
        || ([v5 unmodifiedInput],
            v7 = (__CFString *)objc_claimAutoreleasedReturnValue(),
            [(__CFString *)v7 length] == 1))
      {
        v9 = [MEMORY[0x1E4F1CA48] arrayWithObject:v7];
        if ([v5 modifierState]) {
          [v9 addObject:@"⌘"];
        }
        if (([v5 modifierState] & 2) != 0) {
          [v9 addObject:@"⌥"];
        }
        if (([v5 modifierState] & 4) != 0) {
          [v9 addObject:@"⌃"];
        }
        if (([v5 modifierState] & 8) != 0) {
          [v9 addObject:@"⇧"];
        }
        if (([v5 modifierState] & 0x10) != 0) {
          [v9 addObject:@"⇪"];
        }
        if (([v5 modifierState] & 0x40) != 0) {
          [v9 addObject:@"Fn"];
        }
        id v8 = [MEMORY[0x1E4F48FF8] keyChordWithKeys:v9];
      }
      else
      {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)keyChordByUpdatingModifiersFromEvent:()AXEventRepresentation
{
  id v4 = a3;
  v5 = (void *)MEMORY[0x1E4F1CA80];
  int v6 = [a1 keys];
  v7 = [v5 setWithArray:v6];

  if ([v4 type] == 10
    || [v4 type] == 11
    || [v4 type] == 12)
  {
    id v8 = [v4 keyInfo];
    v9 = v8;
    if (v8)
    {
      if ([v8 modifierState]) {
        [v7 addObject:@"⌘"];
      }
      else {
        [v7 removeObject:@"⌘"];
      }
      if (([v9 modifierState] & 2) != 0) {
        [v7 addObject:@"⌥"];
      }
      else {
        [v7 removeObject:@"⌥"];
      }
      if (([v9 modifierState] & 4) != 0) {
        [v7 addObject:@"⌃"];
      }
      else {
        [v7 removeObject:@"⌃"];
      }
      if (([v9 modifierState] & 8) != 0) {
        [v7 addObject:@"⇧"];
      }
      else {
        [v7 removeObject:@"⇧"];
      }
      if (([v9 modifierState] & 0x10) != 0) {
        [v7 addObject:@"⇪"];
      }
      else {
        [v7 removeObject:@"⇪"];
      }
      if (([v9 modifierState] & 0x40) != 0) {
        [v7 addObject:@"Fn"];
      }
      else {
        [v7 removeObject:@"Fn"];
      }
    }
  }
  v10 = (void *)MEMORY[0x1E4F48FF8];
  v11 = [v7 allObjects];
  v12 = [v10 keyChordWithKeys:v11];

  return v12;
}

@end