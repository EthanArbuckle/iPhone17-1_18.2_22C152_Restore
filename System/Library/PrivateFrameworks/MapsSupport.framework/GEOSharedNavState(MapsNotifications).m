@interface GEOSharedNavState(MapsNotifications)
- (id)arrivalMessage;
- (id)arrivalNotificationBody;
- (id)arrivalNotificationSubtitle;
- (id)chargingStopMessage;
- (id)chargingStopNotificationBody;
- (id)chargingStopNotificationSubtitle;
- (id)initialMessage;
- (id)initialNotificationBody;
- (id)initialNotificationSubtitle;
- (id)intermediateArrivalMessage;
- (id)intermediateArrivalNotificationBody;
- (id)intermediateArrivalNotificationSubtitle;
- (id)senderNameIncludingHandleIfNecessary;
- (id)updateMessage;
- (id)updateNotificationBody;
- (id)updateNotificationSubtitle;
- (id)waypointResumeMessage;
- (id)waypointResumeNotificationBody;
- (id)waypointResumeNotificationSubtitle;
@end

@implementation GEOSharedNavState(MapsNotifications)

- (id)senderNameIncludingHandleIfNecessary
{
  v2 = [a1 senderInfo];
  int v3 = [v2 hasLocalContactIdentifier];

  if (v3)
  {
    v4 = [a1 senderName];
  }
  else
  {
    v5 = NSString;
    v6 = [a1 senderName];
    v7 = [a1 senderInfo];
    v8 = [v7 fromIdentifier];
    v4 = [v5 stringWithFormat:@"%@ (%@)", v6, v8];
  }

  return v4;
}

- (id)initialNotificationSubtitle
{
  v2 = MSPBundle();
  int v3 = [v2 localizedStringForKey:@"[Shared Trip] Notification's subtitle when sharing" value:@"%@ is sharing ETA" table:0];

  v4 = NSString;
  v5 = [a1 senderName];
  v6 = objc_msgSend(v4, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)initialNotificationBody
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 finalETAInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 numberOfIntermediateStopsRemaining];
  v9 = [a1 destinationName];
  v10 = NSString;
  v11 = MSPBundle();
  v12 = v11;
  if (v9)
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] Notification's body when sharing (with destination name)" value:@"localized string not found" table:0];
    v14 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v14, v9, v7);
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] Notification's body when sharing (no destination name)" value:@"localized string not found" table:0];
    v14 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v14, v7, v17);
  v15 = };

  return v15;
}

- (id)initialMessage
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 finalETAInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 numberOfIntermediateStopsRemaining];
  v9 = [a1 destinationName];
  v10 = NSString;
  v11 = MSPBundle();
  v12 = v11;
  if (v9)
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] text message body (with destination name)" value:@"localized string not found" table:0];
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v9, v7);
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] text message body (no destination name)" value:@"localized string not found" table:0];
    objc_msgSend(v10, "localizedStringWithFormat:", v13, v8, v7, v16);
  v14 = };

  return v14;
}

- (id)updateNotificationSubtitle
{
  v2 = NSString;
  int v3 = MSPBundle();
  v4 = [v3 localizedStringForKey:@"[Shared Trip] update Notification's subtitle when sharing" value:@"%@’s ETA has changed" table:0];
  v5 = [a1 senderName];
  v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)updateNotificationBody
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 etaInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 nextWaypointInfo];
  v9 = [v8 name];

  v10 = NSString;
  v11 = MSPBundle();
  v12 = v11;
  if (v9)
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] update Notification's body when sharing (with destination)" value:@"%1$@ will now arrive at %2$@ around %3$@" table:0];
    v14 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v9, v7);
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] update Notification's body when sharing (without destination)" value:@"%1$@ will now arrive around %2$@" table:0];
    v14 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v10, "stringWithFormat:", v13, v14, v7, v17);
  v15 = };

  return v15;
}

- (id)updateMessage
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 etaInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 nextWaypointInfo];
  v9 = [v8 name];

  v10 = NSString;
  v11 = MSPBundle();
  v12 = v11;
  if (v9)
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] update text message body (with destination)" value:@"My updated arrival time to %1$@ is now around %2$@." table:0];
    objc_msgSend(v10, "stringWithFormat:", v13, v9, v7);
  }
  else
  {
    v13 = [v11 localizedStringForKey:@"[Shared Trip] update text message body (without destination)" value:@"My updated arrival time is now around %@." table:0];
    objc_msgSend(v10, "stringWithFormat:", v13, v7, v16);
  v14 = };

  return v14;
}

- (id)chargingStopNotificationSubtitle
{
  v2 = MSPBundle();
  int v3 = [v2 localizedStringForKey:@"[Shared Trip] Notification's subtitle when stopping at a charger" value:@"%@ is making a stop" table:0];

  v4 = NSString;
  v5 = [a1 senderName];
  v6 = objc_msgSend(v4, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)chargingStopNotificationBody
{
  v2 = [a1 nextWaypointInfo];
  int v3 = [v2 name];

  v4 = NSString;
  v5 = MSPBundle();
  v6 = [v5 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at a charger" value:@"%@ has stopped at a charging station in %@." table:0];
  v7 = [a1 senderNameIncludingHandleIfNecessary];
  uint64_t v8 = objc_msgSend(v4, "stringWithFormat:", v6, v7, v3);

  return v8;
}

- (id)chargingStopMessage
{
  v1 = [a1 nextWaypointInfo];
  v2 = [v1 name];

  int v3 = NSString;
  v4 = MSPBundle();
  v5 = [v4 localizedStringForKey:@"[Shared Trip] text message body when stopping at a charger" value:@"I have stopped at a charging station in %@." table:0];
  v6 = objc_msgSend(v3, "stringWithFormat:", v5, v2);

  return v6;
}

- (id)intermediateArrivalNotificationSubtitle
{
  v2 = MSPBundle();
  int v3 = [v2 localizedStringForKey:@"[Shared Trip] Notification's subtitle when stopping at an intermediate waypoint" value:@"%@ is making a stop" table:0];

  v4 = NSString;
  v5 = [a1 senderName];
  v6 = objc_msgSend(v4, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)intermediateArrivalNotificationBody
{
  v2 = [a1 nextWaypointInfo];
  int v3 = [v2 name];

  v4 = [a1 destinationName];
  v5 = NSString;
  v6 = MSPBundle();
  v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at an intermediate waypoint" value:@"%@ is stopping at %@ before continuing to %@." table:0];
    v9 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v5, "stringWithFormat:", v8, v9, v3, v4);
  }
  else
  {
    uint64_t v8 = [v6 localizedStringForKey:@"[Shared Trip] Notification's body when stopping at an intermediate waypoint, generic", @"%@ is stopping at %@ before continuing to their destination.", 0 value table];
    v9 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v5, "stringWithFormat:", v8, v9, v3, v12);
  v10 = };

  return v10;
}

- (id)intermediateArrivalMessage
{
  v2 = [a1 nextWaypointInfo];
  int v3 = [v2 name];

  v4 = [a1 destinationName];
  v5 = NSString;
  v6 = MSPBundle();
  v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 localizedStringForKey:@"[Shared Trip] text message body when stopping at an intermediate waypoint" value:@"I’m making a stop at %@ before continuing to %@." table:0];
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v4);
  }
  else
  {
    uint64_t v8 = [v6 localizedStringForKey:@"[Shared Trip] text message body when stopping at an intermediate waypoint, generic", @"I’m making a stop at %@ before continuing to my destination.", 0 value table];
    objc_msgSend(v5, "stringWithFormat:", v8, v3, v11);
  v9 = };

  return v9;
}

- (id)waypointResumeNotificationSubtitle
{
  v2 = MSPBundle();
  int v3 = [v2 localizedStringForKey:@"[Shared Trip] Notification's subtitle when resuming sharing" value:@"%@ has resumed the route" table:0];

  v4 = NSString;
  v5 = [a1 senderName];
  v6 = objc_msgSend(v4, "stringWithFormat:", v3, v5);

  return v6;
}

- (id)waypointResumeNotificationBody
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 finalETAInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 destinationName];
  v9 = NSString;
  v10 = MSPBundle();
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = [v10 localizedStringForKey:@"[Shared Trip] Notification's body when resuming sharing" value:@"%@ will arrive at %@ around %@. Follow along in Maps." table:0];
    v13 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v9, "stringWithFormat:", v12, v13, v8, v7);
  }
  else
  {
    uint64_t v12 = [v10 localizedStringForKey:@"[Shared Trip] Notification's body when resuming sharing, generic", @"%@ will arrive at their destination around %@. Follow along in Maps.", 0 value table];
    v13 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v9, "stringWithFormat:", v12, v13, v7, v16);
  v14 = };

  return v14;
}

- (id)waypointResumeMessage
{
  v2 = (void *)MEMORY[0x1E4F1C9C8];
  int v3 = [a1 finalETAInfo];
  [v3 etaTimestamp];
  v4 = objc_msgSend(v2, "dateWithTimeIntervalSinceReferenceDate:");

  v5 = (void *)MEMORY[0x1E4F28C10];
  v6 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  v7 = objc_msgSend(v5, "_navigation_localizedTimestampStringForDepartureArrivalDate:inTimeZone:canIncludeDate:", v4, v6, 0);

  uint64_t v8 = [a1 destinationName];
  v9 = NSString;
  v10 = MSPBundle();
  uint64_t v11 = v10;
  if (v8)
  {
    uint64_t v12 = [v10 localizedStringForKey:@"[Shared Trip] Text message body when resuming sharing" value:@"I will arrive at %@ around %@. I’ll let you know if I’m running late." table:0];
    objc_msgSend(v9, "stringWithFormat:", v12, v8, v7);
  }
  else
  {
    uint64_t v12 = [v10 localizedStringForKey:@"[Shared Trip] Text message body when resuming sharing, generic", @"I will arrive at my destination around %@. I’ll let you know if I’m running late.", 0 value table];
    objc_msgSend(v9, "stringWithFormat:", v12, v7, v15);
  v13 = };

  return v13;
}

- (id)arrivalNotificationSubtitle
{
  v2 = NSString;
  int v3 = MSPBundle();
  v4 = [v3 localizedStringForKey:@"[Shared Trip] arrival notification subtitle" value:@"%@ is arriving" table:0];
  v5 = [a1 senderName];
  v6 = objc_msgSend(v2, "stringWithFormat:", v4, v5);

  return v6;
}

- (id)arrivalNotificationBody
{
  v2 = [a1 nextWaypointInfo];
  int v3 = [v2 name];

  v4 = NSString;
  v5 = MSPBundle();
  v6 = v5;
  if (v3)
  {
    v7 = [v5 localizedStringForKey:@"[Shared Trip] arrival notification body" value:@"%@ is arriving at %@." table:0];
    uint64_t v8 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v4, "stringWithFormat:", v7, v8, v3);
  }
  else
  {
    v7 = [v5 localizedStringForKey:@"[Shared Trip] arrival notification body, generic", @"%@ is arriving at their destination.", 0 value table];
    uint64_t v8 = [a1 senderNameIncludingHandleIfNecessary];
    objc_msgSend(v4, "stringWithFormat:", v7, v8, v11);
  v9 = };

  return v9;
}

- (id)arrivalMessage
{
  v1 = [a1 nextWaypointInfo];
  v2 = [v1 name];

  int v3 = NSString;
  v4 = MSPBundle();
  v5 = v4;
  if (v2)
  {
    v6 = [v4 localizedStringForKey:@"[Shared Trip] arrival text message body" value:@"I’m arriving at %@ soon." table:0];
    objc_msgSend(v3, "stringWithFormat:", v6, v2);
  }
  else
  {
    v6 = [v4 localizedStringForKey:@"[Shared Trip] arrival text message body, generic", @"I’m arriving at my destination soon.", 0 value table];
    objc_msgSend(v3, "stringWithFormat:", v6, v9);
  v7 = };

  return v7;
}

@end