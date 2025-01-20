@interface GEOAmenityItem(MUAmenityItemViewModel)
- (id)displayTitle;
- (id)symbolImageForFont:()MUAmenityItemViewModel;
@end

@implementation GEOAmenityItem(MUAmenityItemViewModel)

- (id)symbolImageForFont:()MUAmenityItemViewModel
{
  v2 = objc_msgSend(MEMORY[0x1E4FB1830], "configurationWithFont:");
  if (![a1 isAmenityPresent])
  {
    v8 = @"xmark";
    goto LABEL_6;
  }
  v3 = [a1 symbolImageName];
  uint64_t v4 = [v3 length];

  if (!v4
    || (v5 = (void *)MEMORY[0x1E4FB1818],
        [a1 symbolImageName],
        v6 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v5, "_mapsui_resolvedSymbolImageNamed:withConfiguration:", v6, v2),
        v7 = objc_claimAutoreleasedReturnValue(),
        v6,
        !v7))
  {
    v8 = @"checkmark";
LABEL_6:
    v7 = objc_msgSend(MEMORY[0x1E4FB1818], "_mapsui_systemImageNamed:withConfiguration:", v8, v2);
  }

  return v7;
}

- (id)displayTitle
{
  v2 = [a1 amenityTitle];
  uint64_t v3 = [v2 length];

  if (v3)
  {
    uint64_t v4 = [a1 amenityTitle];
  }
  else
  {
    int v5 = [a1 amenityType] - 1;
    v6 = @"Accepts Credit Cards";
    switch(v5)
    {
      case 0:
        goto LABEL_69;
      case 1:
        v6 = @"Wheelchair Accessible";
        goto LABEL_69;
      case 2:
        v6 = @"Kid Friendly";
        goto LABEL_69;
      case 3:
        v6 = @"Delivery";
        goto LABEL_69;
      case 4:
        v6 = @"Pets Allowed";
        goto LABEL_69;
      case 5:
        v6 = @"Open 24 Hours";
        goto LABEL_69;
      case 6:
        v6 = @"Fitness Center";
        goto LABEL_69;
      case 7:
        v6 = @"Free Breakfast";
        goto LABEL_69;
      case 8:
        v6 = @"Spa";
        goto LABEL_69;
      case 9:
        v6 = @"Swimming Pool";
        goto LABEL_69;
      case 10:
        int v7 = MGGetBoolAnswer();
        v8 = @"Wi-Fi";
        v9 = @"WLAN";
        goto LABEL_16;
      case 11:
        int v7 = MGGetBoolAnswer();
        v8 = @"Free Wi-Fi";
        v9 = @"Free WLAN";
LABEL_16:
        if (v7) {
          v6 = v9;
        }
        else {
          v6 = v8;
        }
        goto LABEL_69;
      case 12:
        v6 = @"Free Internet";
        goto LABEL_69;
      case 13:
        v6 = @"Shuttle Service";
        goto LABEL_69;
      case 14:
        v6 = @"Airport Transportation";
        goto LABEL_69;
      case 15:
        v6 = @"Parking Available";
        goto LABEL_69;
      case 16:
        v6 = @"Parking Garage";
        goto LABEL_69;
      case 17:
        v6 = @"Free Parking";
        goto LABEL_69;
      case 18:
        v6 = @"Smoking Allowed";
        goto LABEL_69;
      case 19:
        v6 = @"Reservations";
        goto LABEL_69;
      case 20:
        v6 = @"Accepts Apple Pay";
        goto LABEL_69;
      case 21:
        v6 = @"Gender-Neutral Restrooms";
        goto LABEL_69;
      case 22:
        v6 = @"Takeout";
        goto LABEL_69;
      case 23:
        v6 = @"Appointment Only";
        goto LABEL_69;
      case 24:
        v6 = @"Good for Groups";
        goto LABEL_69;
      case 25:
        v6 = @"Scenic View";
        goto LABEL_69;
      case 26:
        v6 = @"Outdoor Seating";
        goto LABEL_69;
      case 27:
        v6 = @"Waterfront";
        goto LABEL_69;
      case 28:
        v6 = @"Beachfront";
        goto LABEL_69;
      case 29:
        v6 = @"Dogs Allowed";
        goto LABEL_69;
      case 30:
        v6 = @"Drive-through";
        goto LABEL_69;
      case 31:
        v6 = @"Full Bar";
        goto LABEL_69;
      case 32:
        v6 = @"Vegetarian Options";
        goto LABEL_69;
      case 33:
        v6 = @"Vegan Options";
        goto LABEL_69;
      case 34:
        v6 = @"Glutenfree Options";
        goto LABEL_69;
      case 35:
        v6 = @"Soy-free Options";
        goto LABEL_69;
      case 36:
        v6 = @"Halal Options";
        goto LABEL_69;
      case 37:
        v6 = @"Dairy-free Options";
        goto LABEL_69;
      case 38:
        v6 = @"Meeting Rooms";
        goto LABEL_69;
      case 39:
        v6 = @"Smoke-free property";
        goto LABEL_69;
      case 40:
        v6 = @"Non-smoking Rooms";
        goto LABEL_69;
      case 41:
        v6 = @"Family Rooms";
        goto LABEL_69;
      case 42:
        v6 = @"Bar / Lounge";
        goto LABEL_69;
      case 43:
        v6 = @"Restaurant";
        goto LABEL_69;
      case 44:
        v6 = @"Laundry Service";
        goto LABEL_69;
      case 45:
        v6 = @"Large Tables";
        goto LABEL_69;
      case 46:
        v6 = @"Private Rooms";
        goto LABEL_69;
      case 47:
        v6 = @"High Chairs";
        goto LABEL_69;
      case 48:
        v6 = @"Self Ordering Online";
        goto LABEL_69;
      case 49:
        v6 = @"Online Queuing";
        goto LABEL_69;
      case 50:
        v6 = @"Seating for Couples";
        goto LABEL_69;
      case 51:
        v6 = @"Children's Discount";
        goto LABEL_69;
      case 52:
        v6 = @"IMAX";
        goto LABEL_69;
      case 53:
        v6 = @"Device Trade-in for Credit";
        goto LABEL_69;
      case 54:
        v6 = @"Free Today at Apple Sessions";
        goto LABEL_69;
      case 55:
        v6 = @"Small Business Solutions";
        goto LABEL_69;
      case 56:
        v6 = @"Hardware Repairs and Support";
        goto LABEL_69;
      case 57:
        v6 = @"Genius Bar Walk-ins";
        goto LABEL_69;
      case 58:
        v6 = @"Apple Authorized Service Provider";
        goto LABEL_69;
      case 59:
        v6 = @"Offers Same Day iPhone Screen Repair";
        goto LABEL_69;
      case 60:
        v6 = @"Walk-in Repairs";
        goto LABEL_69;
      case 61:
        v6 = @"Apple Authorized Drop-off Location";
LABEL_69:
        uint64_t v4 = _MULocalizedStringFromThisBundle(v6);
        break;
      default:
        uint64_t v4 = 0;
        break;
    }
  }
  return v4;
}

@end